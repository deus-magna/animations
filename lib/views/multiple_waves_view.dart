import 'package:flutter/material.dart';
import 'dart:math' as math;

class MultipleWavesView extends StatefulWidget {
  @override
  _MultipleWavesViewState createState() => _MultipleWavesViewState();
}

class _MultipleWavesViewState extends State<MultipleWavesView>
    with SingleTickerProviderStateMixin {
  double waveRadius = 0.0;
  double waveGap = 10.0;

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);

    controller.forward();

    animation = Tween(begin: 0.0, end: waveGap).animate(controller)
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
        painter: WavesPainter(waveRadius, waveGap),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}

class WavesPainter extends CustomPainter {
  final double radius;
  final double gap;

  WavesPainter(this.radius, this.gap);

  @override
  void paint(Canvas canvas, Size size) {
    final backPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final orangePaint = Paint()
      ..color = Colors.orange.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final greenPaint = Paint()
      ..color = Colors.green.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final bluePaint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double currentRadius = radius;
    Offset topCenter = Offset(size.width / 2, 0);
    Offset bottomCenter = Offset(size.width / 2, size.height);
    Offset leftCenter = Offset(0, size.height / 2);
    Offset rightCenter = Offset(size.width, size.height / 2);
    final maxRad = maxRadius(size.width / 2, size.height / 2);

    for (var i = 0; currentRadius < maxRad; currentRadius += gap) {
      canvas.drawCircle(topCenter, currentRadius, backPaint);
      canvas.drawCircle(bottomCenter, currentRadius, greenPaint);
      canvas.drawCircle(leftCenter, currentRadius, orangePaint);
      canvas.drawCircle(rightCenter, currentRadius, bluePaint);
    }
  }

  double maxRadius(double x, double y) {
    return math.sqrt(x * x + y * y);
  }

  @override
  bool shouldRepaint(WavesPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(WavesPainter oldDelegate) => true;
}
