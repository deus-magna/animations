import 'dart:ui';

extension ExtendedCanvas on Canvas {
  void drawBlurredCircle(
    Offset offset,
    double radius,
    Paint paint, {
    int step = 1,
    int opacity = 5,
  }) {
    int alpha = 0;
    double currentRadius = radius;
    while (currentRadius > 0) {
      print('Alpha: $alpha , currentRadius: $currentRadius');
      alpha = alpha < 255 ? alpha += opacity : 255;
      currentRadius -= step;
      paint.color = paint.color.withAlpha(alpha);
      this.drawCircle(offset, currentRadius, paint);
    }
  }
}
