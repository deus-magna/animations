import 'package:flutter/material.dart';

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
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(PokeballPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PokeballPainter oldDelegate) => false;
}
