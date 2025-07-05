/// This file defines the shape of the bubble in the navigation bar.
enum BubbleShape {
  /// Represents a circular bubble shape.
  circular,

  /// Represents a square bubble shape.
  square,
}

/// Extension to get the shape value for the bubble.
extension BubbleShapeExtension on BubbleShape {
  /// Returns the shape value based on the bubble shape type.
  double get shape {
    switch (this) {
      case BubbleShape.circular:
        return 50;
      case BubbleShape.square:
        return 10;
    }
  }
}
