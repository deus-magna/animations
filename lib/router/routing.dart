import 'package:animations/views/animated_triangle_view.dart';
import 'package:animations/views/circles_view.dart';
import 'package:animations/views/home_view.dart';
import 'package:animations/views/multiple_waves_view.dart';
import 'package:animations/views/sine_wave_view.dart';
import 'package:animations/views/waves_view.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/triangle': (BuildContext context) => AnimatedTriangleView(),
    '/circles': (BuildContext context) => CirclesView(),
    '/waves': (BuildContext context) => WavesView(),
    '/multi_waves': (BuildContext context) => MultipleWavesView(),
    '/sin': (BuildContext context) => SinWaveView(),
    '/home': (BuildContext context) => HomeView(),
  };
}
