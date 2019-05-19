import 'package:flutter/material.dart';


class PageSignup extends StatefulWidget {
  @override
  PageSignupState createState() => PageSignupState();
}

class PageSignupState extends State<PageSignup> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('welcome'),)
      ,
      body: Center(
        child: PageContainer(),
      )
    );
  }

  Widget PageContainer() {
    return Container(

      child: Column(

        children: <Widget>[
          Text(
            'Signup',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black87,
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/browseGames');
            },
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
