import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Animated Triangle'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => Navigator.of(context).pushNamed('/triangle'),
          )
        ],
      ),
    );
  }
}
