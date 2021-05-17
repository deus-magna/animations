import 'package:animations/router/routing.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //abstract shapes animations
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: getApplicationRoutes(),
      initialRoute: '/home',
    );
  }
}
