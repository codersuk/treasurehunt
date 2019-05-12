import 'package:flutter/material.dart';

class CreateTeam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateTeamState();
  }
}

class CreateTeamState extends State<CreateTeam> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Create Team'),
      ),
      body: Center(
        child: Text('Create Team'),
      ),
    );
  }
}