import 'package:flutter/material.dart';

/// A model class representing a bubble item in the navigation bar.
/// It contains a label, an optional icon widget, and an optional icon data.
class BubbleItem {
  /// The label for the bubble item.
  final String label;

  /// An optional widget for the icon of the bubble item if the user want to use svg or any any other format as icons.
  final Widget? iconWidget;

  /// An optional icon data for the bubble item.
  final IconData? icon;

  /// Constructor for the BubbleItem class.
  const BubbleItem({required this.label, this.iconWidget, this.icon});
}
