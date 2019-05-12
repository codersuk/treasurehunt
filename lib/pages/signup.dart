import 'package:flutter/material.dart';

class PageSignup extends StatefulWidget {
  @override
  PageSignupState createState() => PageSignupState();
}

class PageSignupState extends State<PageSignup> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  Widget PageContainer() {
    return Container(
      padding: EdgeInsets.only(10),
      child: Column(
        children: <Widget>[
          Text('Signup', style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),

          )

        ],
      )
      ,

    );
  }
}
