import 'package:flutter/material.dart';

class Utils {
  static EdgeInsets getNavBarPosition(Alignment alignment) {
    return EdgeInsets.only(
      top: alignment == Alignment.topCenter ? 0 : 1,
      left: [Alignment.topLeft, Alignment.bottomLeft, Alignment.centerLeft]
              .contains(alignment)
          ? 0
          : 1,
      right: [Alignment.topRight, Alignment.bottomRight, Alignment.centerRight]
              .contains(alignment)
          ? 0
          : 1,
      bottom: alignment == Alignment.bottomCenter ? 0 : 1,
    );
  }
}
