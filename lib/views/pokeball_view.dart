import 'package:flutter/material.dart';
import 'dart:math' as math;

class PokeballView extends StatefulWidget {
  @override
  _PokeballViewState createState() => _PokeballViewState();
}

class _PokeballViewState extends State<PokeballView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomPaint(
        painter: PokeballPainter(),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}

class PokeballPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawPokeball(Offset(100, 100), 50, canvas);
    drawPokeball(Offset(size.width / 2, size.height / 2), 100, canvas);
    drawPokeball(Offset(size.width - 100, size.height - 100), 150, canvas);
  }

  void drawPokeball(Offset center, double radius, Canvas canvas) {
    Paint paint = Paint()..color = Colors.red;
    Paint strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.15;

    // Draw the red fill semicircle
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        height: radius * 2,
        width: radius * 2,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );

    paint = Paint()..color = Colors.grey[200];
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        height: radius * 2,
        width: radius * 2,
      ),
      0,
      math.pi,
      false,
      paint,
    );
    canvas.drawLine(Offset(center.dx - radius, center.dy),
        Offset(center.dx + radius, center.dy), strokePaint);
    canvas.drawCircle(center, radius / 4, paint);
    canvas.drawCircle(center, radius / 4, strokePaint);

    strokePaint.strokeWidth = 2;
    canvas.drawCircle(center, radius, strokePaint);
  }

  @override
  bool shouldRepaint(PokeballPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PokeballPainter oldDelegate) => false;
}
