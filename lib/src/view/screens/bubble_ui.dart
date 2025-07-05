import 'package:flutter/material.dart';

import '../../../animated_bubble_navigation_bar.dart';
import '../widgets/combined_widgets.dart';

/// A widget that provides an animated bubble navigation bar.
class CustomBubbleNavBar extends StatefulWidget {
  /// The menu items to be displayed in the navigation bar.
  final List<BubbleItem> items;

  /// The decoration for the bubbles in the navigation bar.
  final BubbleDecoration bubbleDecoration;

  /// Constructor for the CustomBubbleNavBar widget.
  /// It takes a list of items and bubble decoration.
  const CustomBubbleNavBar(
      {super.key, required this.items, required this.bubbleDecoration});

  @override
  State<CustomBubbleNavBar> createState() => CustomBubbleNavBarState();
}

/// The state for the CustomBubbleNavBar widget.
/// It builds the bubble navigation bar with the provided items and decoration.
/// It uses a ValueListenableBuilder to rebuild only the required widgets when the selected index changes.
class CustomBubbleNavBarState extends State<CustomBubbleNavBar> {
  @override
  Widget build(BuildContext context) {
    final bubble = widget.bubbleDecoration;
    final isHorizontal = bubble.axis == Axis.horizontal;

    return Align(
        alignment: bubble.alignment,
        child: Container(
          margin: bubble.margin,
          padding: bubble.padding,
          decoration: BoxDecoration(
            color: widget.bubbleDecoration.backgroundColor,
            borderRadius: BorderRadius.circular(bubble.shapes.shape),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(bubble.shapes.shape),
            child: SingleChildScrollView(
              scrollDirection: bubble.axis,
              physics: bubble.physics,
              child: isHorizontal
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _buildItems(bubble, isHorizontal),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _buildItems(bubble, isHorizontal),
                    ),
            ),
          ),
        ));
  }

  List<Widget> _buildItems(BubbleDecoration bubble, bool isHorizontal) {
    return List.generate(
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
              // final item = widget.items[index];
              // final showCircle = (item.label == null);
              return AnimatedContainer(
                duration: bubble.bubbleDuration,
                curve: bubble.curveIn,
                padding: EdgeInsets.all(bubble.bubbleItemSize),
                decoration: BoxDecoration(
                  // shape: showCircle ? BoxShape.circle : BoxShape.rectangle,
                  color: isSelected
                      ? widget.bubbleDecoration.selectedBubbleBackgroundColor
                      : widget.bubbleDecoration.unSelectedBubbleBackgroundColor,
                  borderRadius: BorderRadius.circular(
                      bubble.squareBordersRadius ?? bubble.shapes.shape),
                ),
                child: isHorizontal
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            _buildLabelIcons(index, isSelected, isHorizontal),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            _buildLabelIcons(index, isSelected, isHorizontal)),
              );
            },
          ),
        );
      },
    );
  }

  List<Widget> _buildLabelIcons(int index, bool isSelected, bool isHorizontal) {
    final bubble = widget.bubbleDecoration;
    final item = widget.items[index];
    return [
      BubbleWidgets.buildIcon(bubble, item, isSelected, isHorizontal),
      if (isSelected)
        SizedBox(
            width: isHorizontal ? bubble.innerIconLabelSpacing : 0,
            height: isHorizontal ? 0 : bubble.innerIconLabelSpacing),
      AnimatedSize(
          duration: bubble.bubbleDuration,
          curve: bubble.curveIn,
          child: isSelected
              ? BubbleWidgets.buildLabel(
                  bubble, item.label, isSelected, isHorizontal)
              : const SizedBox.shrink()),
    ];
  }
}
