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

  void drawGrid(Canvas canvas, Size size, Offset center, double radius) {
    final paint = Paint()
      ..color = Colors.grey[200]
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Horizontal top line
    canvas.drawLine(Offset(0, center.dy - radius),
        Offset(size.width, center.dy - radius), paint);
    // Vertial top line
    canvas.drawLine(Offset(center.dx - radius, 0),
        Offset(center.dx - radius, size.height), paint);

    // Vertical center line
    canvas.drawLine(
        Offset(center.dx, 0), Offset(center.dx, size.height), paint);
    // Horizontal center line
    canvas.drawLine(Offset(0, center.dy), Offset(size.width, center.dy), paint);

    // Horizontal bottom line
    canvas.drawLine(Offset(0, center.dy + radius),
        Offset(size.width, center.dy + radius), paint);

    // Vertial top line
    canvas.drawLine(Offset(center.dx + radius, 0),
        Offset(center.dx + radius, size.height), paint);

    // Vertial double line
    paint
      ..strokeWidth = 4
      ..color = Colors.grey;
    canvas.drawLine(Offset(20, 0), Offset(20, size.height), paint);
  }

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

    drawGrid(canvas, size, center, radius);

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

    final sinPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Draw the circle
    paint
      ..color = Colors.green
      ..strokeWidth = 2;
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

    // Sin point equation
    double sinDy = ((200 * radians) / (2 * math.pi)) - 100;
    print('sinDY: $sinDy, radians: $radians');
    // Draw the sin point
    canvas.drawCircle(Offset(20, (size.height / 2) + sinDy), 5, sinPaint);
    // Draw the line for sin point
    canvas.drawLine(Offset(20, size.height / 2), pointCenter, paint);
  }

  @override
  bool shouldRepaint(SinWavePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(SinWavePainter oldDelegate) => true;
}
