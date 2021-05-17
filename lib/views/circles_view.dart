import 'package:flutter/material.dart';
import 'dart:math' as math;

class CirclesView extends StatefulWidget {
  @override
  _CirclesViewState createState() => _CirclesViewState();
}

class _CirclesViewState extends State<CirclesView>
    with SingleTickerProviderStateMixin {
  double waveRadius = 0.0;

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    controller.forward();

    animation = Tween(begin: 0.0, end: 900.0).animate(controller)
      ..addListener(() {
        setState(() {
          waveRadius = animation.value;
        });
      });

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
        painter: CirclesPainter(waveRadius),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}

class CirclesPainter extends CustomPainter {
  final double radius;

  CirclesPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, radius - 10);
    Offset center2 = Offset(size.width / 4, (radius * 2) - 10);

    canvas.drawCircle(center, 100, paint);
    canvas.drawCircle(center2, 50, paint);
  }

  @override
  bool shouldRepaint(CirclesPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CirclesPainter oldDelegate) => true;
}
