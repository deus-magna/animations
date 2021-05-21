import 'dart:ui';

extension ExtendedCanvas on Canvas {
  void drawBlurredCircle(
    Offset offset,
    double externalRadius,
    double innerRadius,
    Paint paint, {
    double step = 1,
    int innerAlpha = 40,
    int externalAlpha = 1,
  }) {
    double currentRadius = externalRadius;

    while (currentRadius > 0) {
      currentRadius -= step;

      if (currentRadius < ((innerRadius * 2) + externalRadius) / 3) {
        paint.color = paint.color.withAlpha(innerAlpha);
        this.drawCircle(offset, currentRadius, paint);
      } else {
        paint.color = paint.color.withAlpha(externalAlpha);
        this.drawCircle(offset, currentRadius, paint);
      }
    }
  }
}
