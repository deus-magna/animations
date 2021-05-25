import 'package:flutter/material.dart';
import '../canvas/extended_canvas.dart';

class BlurredCircleView extends StatefulWidget {
  @override
  _BlurredCircleViewState createState() => _BlurredCircleViewState();
}

class _BlurredCircleViewState extends State<BlurredCircleView>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // controller =
    //     AnimationController(duration: Duration(seconds: 5), vsync: this);

    // controller.forward();

    // animation = Tween(begin: 0.0, end: math.pi * 2).animate(controller);

    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reset();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
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
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawBlurredCircle(
      Offset(size.width / 2, size.height / 2),
      100,
      10,
      paint,
      step: 2,
      innerAlpha: 20,
      externalAlpha: 10,
    );
  }

  @override
  bool shouldRepaint(BlurPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BlurPainter oldDelegate) => false;
}
