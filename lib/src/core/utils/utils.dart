import 'package:flutter/material.dart';

import '../../../animated_bubble_navigation_bar.dart';
import '../errors/list_exception.dart';

/// A utility class that provides methods for handling navigation bar arguments
class Utils {
  /// Builds the navigation bar widget based on the provided alignment and bubble item size.
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

  /// Validates the arguments passed to the [AnimatedBubbleNavBar] in its constructor.
  static void validateNavBarArguments(
      {required List<Widget> screens,
      required List<BubbleItem> menuItems,
      required int initialIndex}) {
    if (screens.length != menuItems.length) {
      throw BubbleExceptions.listSizesException;
    } else if (initialIndex < 0) {
      throw BubbleExceptions.initialIndexLimit(screens.length - 1);
    } else if ((screens.isNotEmpty) && (initialIndex > screens.length - 1)) {
      throw BubbleExceptions.initialIndexLimit(screens.length - 1);
    }
  }
}
