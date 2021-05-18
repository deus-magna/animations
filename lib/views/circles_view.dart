import 'package:flutter/material.dart';

class CirclesView extends StatefulWidget {
  @override
  _CirclesViewState createState() => _CirclesViewState();
}

class _CirclesViewState extends State<CirclesView>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 10), vsync: this);

    controller.forward();

    animation = Tween(begin: 0.0, end: 1200.0).animate(controller);
    // ..addListener(() {
    //   setState(() {});
    // });

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
        painter: CirclesPainter(animation),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}

class CirclesPainter extends CustomPainter {
  final Animation<double> animation;
  bool isFirst = true;

  CirclesPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    buildCircles(canvas, size, animation.value);
    if (isFirst) {
      if (animation.value >= 600) {
        isFirst = false;
      }
      return;
    }
    buildCircles(canvas, size, (animation.value + 600) % 1200);
  }

  void buildCircles(Canvas canvas, Size size, double difY) {
    final fallingCircles = mockFallingCircles(size, difY);

    for (var circle in fallingCircles) {
      final paint = Paint()
        ..color = circle.color.withOpacity(circle.opacity)
        ..strokeWidth = 8
        ..style = circle.shape == 0 ? PaintingStyle.fill : PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

      canvas.drawCircle(circle.offset, circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(CirclesPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CirclesPainter oldDelegate) => true;
}

class FallingCircle {
  final Offset offset;
  final double radius;
  final int shape;
  final Color color;
  final double opacity;

  FallingCircle(this.offset, this.radius, this.shape,
      {this.color = Colors.orange, this.opacity = 0.5});
}

List<FallingCircle> mockFallingCircles(Size size, double difY) {
  final backCircles = [
    FallingCircle(Offset(size.width - 50, difY / 1.5 - 350), 50, 0,
        opacity: 0.2),
    FallingCircle(Offset(size.width / 2, difY / 2 - 120), 30, 0, opacity: 0.2),
    FallingCircle(Offset(size.width - 50, difY / 2 - 20), 20, 0, opacity: 0.2),
    FallingCircle(Offset(100, difY / 2 - 200), 50, 1, opacity: 0.2),
    FallingCircle(Offset(100, difY / 2 - 200), 25, 0, opacity: 0.2),
    FallingCircle(Offset(20, difY / 2 - 40), 40, 0, opacity: 0.2),
    FallingCircle(Offset(170, difY / 2.1 - 40), 40, 0, opacity: 0.2),
    FallingCircle(Offset(320, difY - 80), 80, 1, opacity: 0.2),
    FallingCircle(Offset(320, difY - 80), 40, 0, opacity: 0.2),
  ];
  final frontCircles = [
    FallingCircle(Offset(size.width - 50, difY * 1.1 - 250), 100, 0),
    FallingCircle(Offset(size.width - 50, difY * 1.1 - 250), 50, 0),
    FallingCircle(Offset(size.width, difY * 1.5 - 150), 80, 0),
    FallingCircle(Offset(size.width, difY * 1.5 - 150), 40, 0),
    FallingCircle(Offset(200, difY - 400), 100, 1),
    FallingCircle(Offset(200, difY - 400), 50, 0),
    FallingCircle(Offset(0, difY * 1.1 - 200), 50, 0),
    FallingCircle(Offset(size.width / 3, difY - 60), 50, 1),
    FallingCircle(Offset(size.width / 3, difY - 60), 25, 0),
    FallingCircle(Offset(90, difY * 0.9 - 180), 80, 0),
    FallingCircle(Offset(90, difY * 0.9 - 180), 40, 0),
  ];

  frontCircles.addAll(backCircles);
  return frontCircles;
}
