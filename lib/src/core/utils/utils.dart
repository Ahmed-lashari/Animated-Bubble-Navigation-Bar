import 'package:flutter/material.dart';

import '../../../animated_bubble_navigation_bar.dart';
import '../errors/list_exception.dart';

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

  static void validateNavBarArguments(
      {required List<Widget> screens,
      required List<BubbleItem> menuItems,
      required int initialIndex}) {
    if (screens.length != menuItems.length) {
      throw BubleExceptions.listSizesException;
    } else if (initialIndex < 0) {
      throw BubleExceptions.initialIndexlimit(screens.length - 1);
    } else if ((screens.isNotEmpty) && (initialIndex > screens.length - 1)) {
      throw BubleExceptions.initialIndexlimit(screens.length - 1);
    }
  }
}
