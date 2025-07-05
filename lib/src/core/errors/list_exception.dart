/// It defines exceptions related to configuration errors in the bubble navigation bar.
class BubbleExceptions {
  /// Exception thrown when the number of screens does not match the number of bottom navigation menu items.
  static const String listSizesException =
      "Configuration Error: The number of screens does not match the number of bottom navigation menuItems. \n"
      "Each navigation item must have a corresponding screen widget. Please ensure both lists are of the same length.";

  /// Exception thrown when the initial index is invalid.
  static String initialIndexStart =
      "Invalid initialIndex! Minimum value for initialIndex must be set to 0.";

  /// Exception thrown when the initial index exceeds the length of the screens.
  /// The [limit] parameter is the maximum valid index.
  static String initialIndexLimit(int limit) =>
      "Invalid initialIndex! Value provided for the initial index exceeds the screens length that is $limit";
}
