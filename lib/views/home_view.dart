import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const arrow = Icon(Icons.arrow_forward_ios_rounded, size: 16);
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Animated Triangle'),
            trailing: arrow,
            onTap: () => Navigator.of(context).pushNamed('/triangle'),
          ),
          ListTile(
            leading: Icon(Icons.waves),
            title: Text('Circular Waves'),
            trailing: arrow,
            onTap: () => Navigator.of(context).pushNamed('/waves'),
          ),
          ListTile(
            leading: Icon(Icons.waves),
            title: Text('Multiple Waves'),
            trailing: arrow,
            onTap: () => Navigator.of(context).pushNamed('/multi_waves'),
          ),
          ListTile(
            leading: Icon(Icons.waves),
            title: Text('Circles'),
            trailing: arrow,
            onTap: () => Navigator.of(context).pushNamed('/circles'),
          ),
          ListTile(
            leading: Icon(Icons.waves),
            title: Text('Sin Wave'),
            trailing: arrow,
            onTap: () => Navigator.of(context).pushNamed('/sin'),
          ),
          ListTile(
            leading: Icon(Icons.sports_baseball_sharp),
            title: Text('Pokeball'),
            trailing: arrow,
            onTap: () => Navigator.of(context).pushNamed('/pokeball'),
          )
        ],
      ),
    );
  }
}
