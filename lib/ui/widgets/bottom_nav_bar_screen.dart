import 'package:animated_bubble_navigation_bar/core/entities/enums/shapes.dart';
import 'package:flutter/material.dart';

import '../../core/entities/enums/alignemnts.dart';
import '../../core/model/bottom_nav_bar_decoration.dart';
import '../../core/model/bottom_nav_item.dart';
import '../../core/providers/providers.dart';

class AnimatedBubbleNavBottomBar extends StatelessWidget {
  final List<Widget> screens;
  final List<BottomNavItem> menuItems;
  final BubbleDecoration bobbleDecoration;
  const AnimatedBubbleNavBottomBar(
      {super.key,
      required this.screens,
      required this.menuItems,
      this.bobbleDecoration = const BubbleDecoration()});

  @override
  Widget build(BuildContext context) {
    final align = bobbleDecoration.bubbleAlignment.alignment;
    if (screens.length != menuItems.length) {
      throw Exception(
          "Configuration Error: The number of screens (${screens.length}) does not match the number of bottom navigation items (${menuItems.length}). \n"
          "Each navigation item must have a corresponding screen widget. Please ensure both lists are of the same length.");
    }

    debugPrint('home nav bar tabs screen');

    return Stack(children: [
      _buildBodyWidgets(align, bobbleDecoration.bubbleItemSize),
      _buildBottomnavBar(align)
    ]);
  }

  Widget _buildBodyWidgets(Alignment align, double height) {
    return Positioned.fill(
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndexNotifier,
        builder: (context, selectedIndex, _) {
          return Stack(
            children: List.generate(screens.length, (index) {
              return Offstage(
                offstage: selectedIndex != index,
                child: TickerMode(
                  enabled: selectedIndex == index,
                  child: screens[index],
                ),
              );
            }),
          );
        },
      ),
    );
  }

  Widget _buildBottomnavBar(Alignment align) {
    return Positioned(
      top: align == Alignment.topCenter ? 0 : 1,
      left: ((align == Alignment.topLeft) ||
              (align == Alignment.bottomLeft) ||
              (align == Alignment.bottomLeft))
          ? 0
          : 1,
      right: ((align == Alignment.topRight) ||
              (align == Alignment.bottomRight) ||
              (align == Alignment.centerRight))
          ? 0
          : 1,
      bottom: align == Alignment.bottomCenter ? 0 : 1,
      child: _CustomBottomNavBar(
          items: menuItems, bobbleDecoration: bobbleDecoration),
    );
  }
}

// =========================================================================================

class _CustomBottomNavBar extends StatefulWidget {
  final List<BottomNavItem> items;
  final BubbleDecoration bobbleDecoration;

  const _CustomBottomNavBar(
      {required this.items, required this.bobbleDecoration});

  @override
  State<_CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<_CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final bubble = widget.bobbleDecoration;
    debugPrint('whole nav bar rebuilding');
    return Align(
        alignment: bubble.bubbleAlignment.alignment,
        child: Container(
          margin: bubble.margin,
          padding: bubble.padding,
          decoration: BoxDecoration(
            color: widget.bobbleDecoration.backgroundColor,

            // OUTER CONTAINER BORDERS
            borderRadius: BorderRadius.circular(bubble.shapes.shape),
          ),
          child: ClipRRect(
            // OUTER CONTAINER BORDERS
            borderRadius: BorderRadius.circular(bubble.shapes.shape),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: bubble.physics,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  widget.items.length,
                  (index) {
                    // debugPrint("list items creating");
                    return GestureDetector(
                      onTap: () {
                        if (selectedIndexNotifier.value != index) {
                          selectedIndexNotifier.value = index;
                          debugPrint("changed");
                        }
                      },
                      child: ValueListenableBuilder<int>(
                        valueListenable: selectedIndexNotifier,
                        builder: (context, selectedIndex, _) {
                          final isSelected = index == selectedIndex;
                          final item = widget.items[index];
                          return AnimatedContainer(
                            duration: bubble.duration,
                            curve: bubble.curve,
                            padding: EdgeInsets.all(bubble.bubbleItemSize),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? widget.bobbleDecoration
                                      .selectedBubbleBackgroundColor
                                  : widget.bobbleDecoration
                                      .unSelectedBubbleBackgroundColor,
                              borderRadius: BorderRadius.circular(
                                  bubble.squareBordersRadius ??
                                      bubble.shapes.shape),
                            ),
                            child: SizedBox(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildIcon(item, isSelected) ??
                                      SizedBox.shrink(),
                                  AnimatedSize(
                                    duration: bubble.duration,
                                    curve: Curves.easeInOut,
                                    child: (isSelected)
                                        ? _buildLabel(item.lable, isSelected)
                                        : SizedBox.shrink(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }

  // ======================================= WIDGETS =======================================

  Widget? _buildIcon(BottomNavItem item, bool isSelected) {
    final bubble = widget.bobbleDecoration;
    if ((item.icon == null) && (item.iconWidget == null) && (!isSelected)) {
      return _buildLabel(" ${item.lable[0].toUpperCase()}", isSelected);
    } else if (item.icon != null) {
      return Icon(
        item.icon,
        color: isSelected
            ? bubble.selectedBubbleIconColor
            : bubble.unSelectedBubbleIconColor,
        size: bubble.iconSize,
      );
    } else if (item.iconWidget != null) {
      return item.iconWidget;
    }
    return null;
  }

  Widget _buildLabel(String label, bool isSelected) {
    final bubble = widget.bobbleDecoration;
    return Padding(
      padding:
          EdgeInsets.only(left: isSelected ? bubble.innerIconLabelSpacing : 0),
      child: Text(
        label,
        style: TextStyle(
            fontSize: bubble.labelStyle.fontSize ?? 12,
            fontStyle: bubble.labelStyle.fontStyle,
            color: bubble.labelStyle.color ?? bubble.selectedBubbleLabelColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
