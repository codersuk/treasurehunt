import 'package:flutter/material.dart';

// Pages
import 'pages/signup.dart';
import 'pages/browse.dart';
import 'pages/createteam.dart';
import 'pages/currentQuiz.dart';

void main() => runApp(TreasureHuntApp());

class TreasureHuntApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treasure Hunt Game',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),

//    See guide on navigator routes: https://flutter.dev/docs/cookbook/navigation/named-routes
      initialRoute: '/CurrentQuiz',
      routes: {
        '/': (context) => PageSignup(),
        '/browseGames': (context) => PageBrowse(),
        '/createTeam': (context) => CreateTeam(),
        '/CurrentQuiz': (context) => CurrentQuizPage(),

      },
    );
  }
}