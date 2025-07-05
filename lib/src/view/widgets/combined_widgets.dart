import 'package:flutter/material.dart';

import '../../core/models/bubble_model.dart';
import '../../core/models/decoration.dart';

/// A utility class to build widgets for the bubble navigation bar.
class BubbleWidgets {
  /// Builds the bubble item widget based on the provided decoration and item.
  static Widget buildIcon(BubbleDecoration bubble, BubbleItem item,
      bool isSelected, bool isHorizontal) {
    if (item.icon != null) {
      return Icon(
        item.icon,
        color: isSelected
            ? bubble.selectedBubbleIconColor
            : bubble.unSelectedBubbleIconColor,
        size: bubble.iconSize,
      );
    } else if (item.iconWidget != null) {
      return item.iconWidget!;
    } else if (!isSelected) {
      return buildLabel(
          bubble, " ${item.label[0].toUpperCase()}", isSelected, isHorizontal);
    }
    return const SizedBox.shrink();
  }

  /// Builds the label for a bubble item.
  /// Label is displayed with padding on the left if the bubble is selected.
  static Widget buildLabel(BubbleDecoration bubble, String label,
      bool isSelected, bool isHorizontal) {
    final displayLabel = isHorizontal ? label : label.split('').join('\n');

    return Text(displayLabel,
        textAlign: TextAlign.center,
        style: isSelected
            ? bubble.selectedBubbleLabelStyle
            : bubble.unSelectedBubbleLabelStyle);
  }
}
