import 'package:flutter/material.dart';
import '../entities/enums/shapes.dart';

/// A class that defines the decoration and styling for the bubble navigation bar.
/// It includes colors, text styles, icon sizes, and other visual properties.
/// This class is used to customize the appearance of the bubbles in the navigation bar.
class BubbleDecoration {
// =========================== BACKGROUND COLORS ===========================
  /// The background color of the bubble navigation bar.
  final Color backgroundColor;

  /// The background color of the selected bubble.
  final Color selectedBubbleBackgroundColor;

  /// The background color of the unselected bubble.
  final Color unSelectedBubbleBackgroundColor;

// =========================== LABEL COLORS ===========================
  /// The color of the label text in the selected bubble.
  final Color selectedBubbleLabelColor;

  /// The color of the label text in the unselected bubble.
  final Color unSelectedBubbleLabelColor;

// =========================== ICON COLORS ===========================
  /// This is used to highlight the icon when the bubble is selected.
  final Color selectedBubbleIconColor;

  /// This is used to highlight the icon when the bubble is unselected.
  final Color unSelectedBubbleIconColor;

  // =========================== LABEL STYLE ===========================
  /// The [TextStyle] for the label in the bubbles.
  final TextStyle selectedBubbleLabelStyle;

  /// The [TextStyle] for the label in the unselected bubbles.
  final TextStyle unSelectedBubbleLabelStyle;

  // =========================== ICONS ===========================
  /// The size of the icons in the bubbles.
  final double iconSize;

  // =========================== SIZES ===========================
  /// The spacing between the inner icon and label in the bubble.
  final double innerIconLabelSpacing;

  // =========================== GENERAL STYLING ===========================

  /// The physics for the scrollable area of the bubble navigation bar.
  final ScrollPhysics physics;

  /// The duration of the animations in the bubble navigation bar.
  final Duration bubbleDuration;

  /// The duration for screen transitions when changing screens.
  final Duration? screenTransitionDuration;

  /// The transition builder for screen transitions.
  final AnimatedSwitcherTransitionBuilder? screenTransitionBuilder;

  /// The margin around the bubble navigation bar.
  final EdgeInsets margin;

  /// The padding inside the bubble navigation bar.
  final EdgeInsets padding;

  /// The curve for the animations in the bubble navigation bar.
  final Curve curveIn;

  /// The curve for the animations when the bubble is not selected.
  final Curve curveOut;

  /// The axis along which the bubbles are arranged in the navigation bar.
  /// Can be either [Axis.horizontal] or [Axis.vertical].
  final Axis axis;

  // =========================== ENUMS ===========================

  /// The size of the bubble items in the navigation bar.
  final double bubbleItemSize;

  /// The alignment of the bubble items in the navigation bar.
  final Alignment alignment;

  /// The shape of the bubbles in the navigation bar.
  final BubbleShape shapes;

  /// The radius for square borders of the bubbles, if applicable.
  final double? squareBordersRadius;

  /// Creates a [BubbleDecoration] instance with customizable properties.
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
    this.selectedBubbleLabelStyle = const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal),
    this.unSelectedBubbleLabelStyle = const TextStyle(
        fontSize: 13, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
    this.iconSize = 30,

    // GENERAL STYLING
    // bottom nav bar background color
    this.backgroundColor = Colors.deepPurpleAccent,
    this.innerIconLabelSpacing = 5,
    this.bubbleItemSize = 10,
    this.physics = const BouncingScrollPhysics(),
    this.bubbleDuration = const Duration(milliseconds: 300),
    this.screenTransitionDuration,
    this.screenTransitionBuilder,
    this.margin = const EdgeInsets.all(5),
    this.padding = const EdgeInsets.all(5),
    this.curveIn = Curves.easeIn,
    this.curveOut = Curves.easeOut,
    this.axis = Axis.horizontal,

    // ENUMS
    this.alignment = Alignment.bottomCenter,
    this.shapes = BubbleShape.circular,
    this.squareBordersRadius,
  });
}
