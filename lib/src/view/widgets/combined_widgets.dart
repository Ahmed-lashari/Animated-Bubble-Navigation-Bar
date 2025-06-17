import 'package:flutter/material.dart';

import '../../core/models/bubble_model.dart';
import '../../core/models/decoration.dart';

class BubbleWidgets {
  static Widget? buildIcon(
      BubbleDecoration bubble, BubbleItem item, bool isSelected) {
    if ((item.icon == null) && (item.iconWidget == null) && (!isSelected)) {
      return buildLabel(bubble, " ${item.lable[0].toUpperCase()}", isSelected);
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

  static Widget buildLabel(
      BubbleDecoration bubble, String label, bool isSelected) {
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
