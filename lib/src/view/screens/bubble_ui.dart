import 'package:flutter/material.dart';

import '../../../animated_bubble_navigation_bar.dart';
import '../widgets/combined_widgets.dart';

class CustomBottomNavBar extends StatefulWidget {
  final List<BubbleItem> items;
  final BubbleDecoration bobbleDecoration;

  const CustomBottomNavBar(
      {super.key, required this.items, required this.bobbleDecoration});

  @override
  State<CustomBottomNavBar> createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final bubble = widget.bobbleDecoration;
    return Align(
        alignment: bubble.bubbleAlignment.alignment,
        child: Container(
          margin: bubble.margin,
          padding: bubble.padding,
          decoration: BoxDecoration(
            color: widget.bobbleDecoration.backgroundColor,
            borderRadius: BorderRadius.circular(bubble.shapes.shape),
          ),
          child: ClipRRect(
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
                                  BubbleWidgets.buildIcon(
                                          bubble, item, isSelected) ??
                                      SizedBox.shrink(),
                                  AnimatedSize(
                                    duration: bubble.duration,
                                    curve: Curves.easeInOut,
                                    child: (isSelected)
                                        ? BubbleWidgets.buildLabel(
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
