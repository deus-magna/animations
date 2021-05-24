import 'package:flutter/material.dart';
import 'dart:math' as math;

class SinWaveView extends StatefulWidget {
  @override
  _SinWaveViewState createState() => _SinWaveViewState();
}

class _SinWaveViewState extends State<SinWaveView>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    controller.forward();

    animation = Tween(begin: 0.0, end: math.pi * 2).animate(controller);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomPaint(
        painter: SinWavePainter(animation),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}

class SinWavePainter extends CustomPainter {
  final Animation<double> animation;

  SinWavePainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    // Circles have a circumference of 2pi
    final radians = animation.value;
    // Our circle radius
    final double radius = 100;
    // The start point
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));
    // Center of the canvas
    Offset center = Offset(size.width / 2, size.height / 2);
    // Center of the point
    Offset pointCenter =
        Offset(startPoint.dx + center.dx, startPoint.dy + center.dy);

    final paint = Paint()
      ..color = Colors.grey[200]
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final solidPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, size.height / 2 - 100),
        Offset(size.width, size.height / 2 - 100), paint);

    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);

    canvas.drawLine(Offset(0, size.height / 2 + 100),
        Offset(size.width, size.height / 2 + 100), paint);

    // Draw the circle
    paint.color = Colors.green;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);
    canvas.drawCircle(pointCenter, 5, solidPaint);

    // Draw the center
    solidPaint.color = Colors.orange;
    canvas.drawCircle(center, 5, solidPaint);
    canvas.drawLine(center, pointCenter, solidPaint);

    // Draw the center circle arc
    paint.color = Colors.orange;
    solidPaint.color = Colors.orange.withOpacity(0.2);
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        height: radius,
        width: radius,
      ),
      0,
      radians,
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        height: radius,
        width: radius,
      ),
      0,
      radians,
      true,
      solidPaint,
    );
  }

  @override
  bool shouldRepaint(SinWavePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SinWavePainter oldDelegate) => false;
}
