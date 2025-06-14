import 'src/core/entities/enums/alignemnts.dart';
import 'src/core/entities/enums/shapes.dart';
import 'package:flutter/material.dart';
import 'src/core/errors/list_exception.dart';
import 'src/core/models/bubble_model.dart';
import 'src/core/models/decoration.dart';
import 'src/view/widgets/combined_widgets.dart';
import 'src/viewmodel/providers.dart';

// widgets
export 'src/view/widgets/combined_widgets.dart';
// providers
export 'src/viewmodel/providers.dart';
//enums
export 'src/core/entities/enums/alignemnts.dart';
export 'src/core/entities/enums/shapes.dart';
//models
export 'src/core/models/bubble_model.dart';
export 'src/core/models/decoration.dart';

class AnimatedBubbleNavBottomBar extends StatelessWidget {
  final List<Widget> screens;
  final List<BubbleItem> menuItems;
  final BubbleDecoration bubbleDecoration;
  const AnimatedBubbleNavBottomBar(
      {super.key,
      required this.screens,
      required this.menuItems,
      this.bubbleDecoration = const BubbleDecoration()});

  @override
  Widget build(BuildContext context) {
    final align = bubbleDecoration.bubbleAlignment.alignment;
    if (screens.length != menuItems.length) {
      throw BubleExceptions.listSizesException;
    }

    return Stack(children: [
      _buildBodyWidgets(align, bubbleDecoration.bubbleItemSize),
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
          items: menuItems, bobbleDecoration: bubbleDecoration),
    );
  }
}

// =========================================================================================

class _CustomBottomNavBar extends StatefulWidget {
  final List<BubbleItem> items;
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
                                  CustomWidgets.buildIcon(
                                          bubble, item, isSelected) ??
                                      SizedBox.shrink(),
                                  AnimatedSize(
                                    duration: bubble.duration,
                                    curve: Curves.easeInOut,
                                    child: (isSelected)
                                        ? CustomWidgets.buildLabel(
                                            bubble, item.lable, isSelected)
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
}
