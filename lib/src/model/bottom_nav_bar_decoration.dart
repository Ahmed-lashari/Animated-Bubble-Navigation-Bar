import 'package:flutter/material.dart';

import '../core/entities/enums/alignemnts.dart';
import '../core/entities/enums/shapes.dart';

class BubbleDecoration {
  // =========================== COLORS ===========================
  // bubble background
  final Color selectedBubbleBackgroundColor;
  final Color unSelectedBubbleBackgroundColor;

  // label
  final Color selectedBubbleLabelColor;
  final Color unSelectedBubbleLabelColor;

  // icon
  final Color selectedBubbleIconColor;
  final Color unSelectedBubbleIconColor;

  // =========================== TEXT LABEL ===========================
  final TextStyle labelStyle;

  // =========================== ICONS ===========================
  final double iconSize;

  // =========================== GENERAL STYLING ===========================

  final Color backgroundColor;
  final double innerIconLabelSpacing;
  final double bubbleItemSize;
  final ScrollPhysics physics;
  final Duration duration;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Curve curve;
  // final BubbleAxis axis;

  // =========================== ENUMS ===========================

  // alignemnt (coulb be used as bottom navigation bar and tab bar as well)
  final BubbleAlignment bubbleAlignment;
  final BubbleShape shapes;

  final double? squareBordersRadius;

  const BubbleDecoration({
    // COLORS

    // bubble
    this.selectedBubbleBackgroundColor = Colors.white70,
    this.unSelectedBubbleBackgroundColor = Colors.deepPurple,

    // label
    this.selectedBubbleLabelColor = Colors.black87,
    this.unSelectedBubbleLabelColor = Colors.white70,

    // icon
    this.selectedBubbleIconColor = Colors.black87,
    this.unSelectedBubbleIconColor = Colors.white70,

    // SIZES
    this.labelStyle = const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal),
    this.iconSize = 30,

    // GENERAL STYLING
    // bottom nav bar background color
    this.backgroundColor = Colors.deepPurpleAccent,
    this.innerIconLabelSpacing = 5,
    this.bubbleItemSize = 10,
    this.physics = const BouncingScrollPhysics(),
    this.duration = const Duration(milliseconds: 300),
    this.margin = const EdgeInsets.all(5),
    this.padding = const EdgeInsets.all(5),
    this.curve = Curves.easeIn,
    // this.axis = BubbleAxis.horizontal,

    // ENUMS
    this.bubbleAlignment = BubbleAlignment.bottomCenter,
    this.shapes = BubbleShape.circular,
    this.squareBordersRadius,
  });
}
