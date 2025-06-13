import 'package:flutter/material.dart';

enum BubbleAlignment {
  // topCenter,
  // topLeft,
  // topRight,
  bottomCenter,
  bottomLeft,
  bottomRight
}

extension BubbleAlignmentExtension on BubbleAlignment {
  Alignment get alignment {
    switch (this) {
      // case BubbleAlignment.topCenter:
      //   return Alignment.topCenter;
      // case BubbleAlignment.topLeft:
      //   return Alignment.topLeft;
      // case BubbleAlignment.topRight:
      //   return Alignment.topRight;
      case BubbleAlignment.bottomCenter:
        return Alignment.bottomCenter;
      case BubbleAlignment.bottomLeft:
        return Alignment.bottomLeft;
      case BubbleAlignment.bottomRight:
        return Alignment.bottomRight;
    }
  }
}
