enum BubbleShape {
  circular,
  square,
}

extension BubbleShapeExtension on BubbleShape {
  double get shape {
    switch (this) {
      case BubbleShape.circular:
        return 50;
      case BubbleShape.square:
        return 10;
    }
  }
}
