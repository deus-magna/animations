import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../canvas/extended_canvas.dart';

class BlurCircleView extends StatefulWidget {
  @override
  _BlurCircleViewState createState() => _BlurCircleViewState();
}

class _BlurCircleViewState extends State<BlurCircleView>
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
        painter: BlurPainter(animation),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}

class BlurPainter extends CustomPainter {
  final Animation<double> animation;

  BlurPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[200]
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    paint.color = Colors.blue.withOpacity(0.8);
    canvas.drawCircle(Offset(size.width - 150, size.height - 80), 100, paint);
    canvas.drawCircle(Offset(size.width - 250, size.height - 80), 100, paint);
    paint.color = Colors.blue;
    canvas.drawBlurredCircle(
      Offset(size.width / 2, size.height / 2),
      100,
      5,
      paint,
      step: 1,
      innerAlpha: 0,
      externalAlpha: 10,
    );
  }

  @override
  bool shouldRepaint(BlurPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BlurPainter oldDelegate) => false;
}
