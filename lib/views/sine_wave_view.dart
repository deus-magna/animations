import 'package:flutter/material.dart';

class SinWaveView extends StatefulWidget {
  @override
  _SinWaveViewState createState() => _SinWaveViewState();
}

class _SinWaveViewState extends State<SinWaveView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomPaint(
        painter: SinWavePainter(),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}

class SinWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, size.height / 2 - 100),
        Offset(size.width, size.height / 2 - 100), paint);

    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);

    canvas.drawLine(Offset(0, size.height / 2 + 100),
        Offset(size.width, size.height / 2 + 100), paint);

    paint.color = Colors.black.withOpacity(0.5);
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);
    paint.color = Colors.orange;
    canvas.drawBluredCircle(Offset(size.width / 2, size.height / 2), 180, paint,
        step: 2, opacity: 1);
  }

  @override
  bool shouldRepaint(SinWavePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SinWavePainter oldDelegate) => false;
}

extension ExtendedCanvas on Canvas {
  void drawBluredCircle(
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
    // for (int i = 0; i <= radius; i += step) {
    //   alpha = alpha <= 2 ? 2 : alpha = alpha - opacity;
    //   print('Radius: $i, alpha: $alpha');
    //   paint.color = paint.color.withAlpha(alpha);
    //   this.drawCircle(offset, i.toDouble(), paint);
    // }
  }
}
