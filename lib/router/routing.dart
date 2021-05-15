import 'package:animations/views/animated_triangle_view.dart';
import 'package:animations/views/home_view.dart';
import 'package:animations/views/waves_view.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/triangle': (BuildContext context) => AnimatedTriangleView(),
    '/waves': (BuildContext context) => WavesView(),
    '/home': (BuildContext context) => HomeView(),
  };
}
