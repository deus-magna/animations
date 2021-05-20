import 'package:flutter/material.dart';
import '../canvas/extended_canvas.dart';

class SinWaveView extends StatefulWidget {
  @override
  _SinWaveViewState createState() => _SinWaveViewState();
}

class _SinWaveViewState extends State<SinWaveView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomPaint(
        painter: SinWavePainter(),
        child: Container(
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}

class SinWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, size.height / 2 - 100),
        Offset(size.width, size.height / 2 - 100), paint);

    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);

    canvas.drawLine(Offset(0, size.height / 2 + 100),
        Offset(size.width, size.height / 2 + 100), paint);

    paint.color = Colors.black.withOpacity(0.5);
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);
    paint.color = Colors.orange;
    canvas.drawBlurredCircle(
        Offset(size.width / 2, size.height / 2), 180, paint,
        step: 2, opacity: 1);
  }

  @override
  bool shouldRepaint(SinWavePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SinWavePainter oldDelegate) => false;
}
