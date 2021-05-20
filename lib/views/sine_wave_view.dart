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

    canvas.drawBluredCircle(
        Offset(size.width / 2, size.height - 150), 50, paint);
    drawBluredCircle(canvas, size, 50, 1);

    // paint.color = Colors.black12;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 61, paint);
    // paint.color = Colors.black26;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 60, paint);
    // paint.color = Colors.black38;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 58, paint);
    // paint.color = Colors.black45;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 56, paint);
    // paint.color = Colors.black54;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 54, paint);
    // paint.color = Colors.black87;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 52, paint);
    // paint.color = Colors.black;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, paint);
  }

  void drawBluredCircle(Canvas canvas, Size size, double radius, int step) {
    int alpha = 255;
    final paint = Paint()
      ..color = Colors.black.withAlpha(alpha)
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    for (double i = step.toDouble(); i <= radius; i += step) {
      alpha = alpha - 5;
      // print('Radius: $i, alpha: $alpha');
      paint.color = Colors.black.withAlpha(alpha);
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), i, paint);
    }
  }

  @override
  bool shouldRepaint(SinWavePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SinWavePainter oldDelegate) => false;
}

extension ExtendedCanvas on Canvas {
  void drawBluredCircle(Offset offset, double radius, Paint paint) {
    int step = 1;
    int alpha = 255;
    for (int i = 0; i <= radius; i += step) {
      alpha = alpha - 5;
      print('Radius: $i, alpha: $alpha');
      paint.color = Colors.black.withAlpha(alpha);
      this.drawCircle(offset, i.toDouble(), paint);
    }
  }
}
