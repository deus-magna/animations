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
    Paint paint = Paint()..color = Colors.red;
    Paint strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // Draw the red fill semicircle
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        height: 200,
        width: 200,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );

    paint = Paint()..color = Colors.grey[200];
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        height: 200,
        width: 200,
      ),
      0,
      math.pi,
      false,
      paint,
    );
    canvas.drawLine(Offset(size.width / 2 - 100, size.height / 2),
        Offset(size.width / 2 + 100, size.height / 2), strokePaint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, strokePaint);
  }

  @override
  bool shouldRepaint(PokeballPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PokeballPainter oldDelegate) => false;
}
