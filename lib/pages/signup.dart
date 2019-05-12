import 'package:flutter/material.dart';
import 'browse.dart';

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
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context){
                  return PageBrowse();
                })
              );
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
