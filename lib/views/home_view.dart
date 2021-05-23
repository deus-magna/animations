import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Animated Triangle'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => Navigator.of(context).pushNamed('/triangle'),
          ),
          ListTile(
            leading: Icon(Icons.waves),
            title: Text('Circular Waves'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => Navigator.of(context).pushNamed('/waves'),
          ),
          ListTile(
            leading: Icon(Icons.waves),
            title: Text('Multiple Waves'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => Navigator.of(context).pushNamed('/multi_waves'),
          ),
          ListTile(
            leading: Icon(Icons.waves),
            title: Text('Circles'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => Navigator.of(context).pushNamed('/circles'),
          ),
          ListTile(
            leading: Icon(Icons.waves),
            title: Text('Sin Wave'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => Navigator.of(context).pushNamed('/sin'),
          ),
          ListTile(
            leading: Icon(Icons.sports_baseball_sharp),
            title: Text('Pokeball'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => Navigator.of(context).pushNamed('/pokeball'),
          )
        ],
      ),
    );
  }
}
