import 'package:flutter/material.dart';
import 'dart:math';

class CreateTeam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateTeamState();
  }
}

class CreateTeamState extends State<CreateTeam> {

  int teamCode;

  @override
  void initState() {
    super.initState();
    var rand = new Random();
    int min = 1000;
    int max = 9999;
    teamCode = min + rand.nextInt(max - min);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Create Team'),
      ),
      body: Center(
        child: Column (
          children: <Widget>[
            Text(teamCode.toString()),
            Flexible(
              child: new Container(
                child: Column(
                  children: <Widget>[
                    Text("Team member 1"),
                    Text("Team member 2"),
                    Text("Team member 3"),
                  ],
                )
              )
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context){
                     // return PageBrowse();
                    })
                );
              },
              child: Text("Start"),
            )
          ],
        ),
      ),
    );
  }
}