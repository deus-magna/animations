import 'package:flutter/material.dart';
import 'dart:math' as math;

class WavesView extends StatefulWidget {
  @override
  _WavesViewState createState() => _WavesViewState();
}

class _WavesViewState extends State<WavesView>
    with SingleTickerProviderStateMixin {
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
        setState(() {});
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
        painter: WavesPainter(animation, waveGap),
        child: Container(
          color: Colors.lightBlue.withOpacity(0.5),
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}

class WavesPainter extends CustomPainter {
  final Animation<double> animation;
  final double gap;

  WavesPainter(this.animation, this.gap);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double currentRadius = animation.value;
    Offset center = Offset(size.width / 2, size.height / 2);
    final maxRad = maxRadius(size.width / 2, size.height / 2);

    for (int i = 0; currentRadius < maxRad; currentRadius += gap) {
      canvas.drawCircle(center, currentRadius, paint);
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
