import 'package:flutter/material.dart';
import 'package:treasurehunt/pages/createteam.dart';
import 'createteam.dart';

class PageBrowse extends StatefulWidget {
  @override
  PageBrowseState createState() => PageBrowseState();
}

class PageBrowseState extends State<PageBrowse> {
  List<String> quizList = ['quiz1', 'quiz2', 'quiz3'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('welcome'),
        ),
        body: ListView(
          children: getListItems()
        ));
  }

  List<ListTile> getListItems() {
    return quizList.map((item) {
        print(item);
        return new ListTile(
          leading: Icon(Icons.map),
          title: Text(item),
          onTap: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return CreateTeam();
              }
            ));
          },
        );
    }).toList();
  }
}
