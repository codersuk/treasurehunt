import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Page'),
      ),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
