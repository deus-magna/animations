import 'package:animations/views/animated_triangle_view.dart';
import 'package:animations/views/home_view.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/triangle': (BuildContext context) => AnimatedTriangleView(),
    '/home': (BuildContext context) => HomeView(),
  };
}
