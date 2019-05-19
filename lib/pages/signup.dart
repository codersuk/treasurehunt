import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class PageSignup extends StatefulWidget {
  @override
  PageSignupState createState() => PageSignupState();
}

class PageSignupState extends State<PageSignup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  bool _success;
  String _userEmail;
  String _message = "";


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
//    return Container(
//
//      child: Column(
//
//        children: <Widget>[
//          Text(
//            'Signup',
//            style: TextStyle(
//              fontSize: 32,
//              color: Colors.black87,
//            ),
//          ),
//          RaisedButton(
//            onPressed: () {
//              Navigator.pushNamed(context, '/browseGames');
//            },
//            child: Text(
//              'Sign Up',
//              style: TextStyle(fontSize: 20),
//            ),
//          )
//        ],
//      ),
//    );

    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter email address';
              }
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            validator: (String value) {
              if (value.isEmpty) {
                return "Please enter password";
              }
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed:() async{
                if(_formKey.currentState.validate()) {
                  _register();
                } else {
                  _success = false;
                  _message = "form not valid";
                }
              },
              child: Text('Register', style: TextStyle(fontSize: 20)),
            ),
          ),
            Container(
              alignment: Alignment.center,
              child: Text(_success == null
              ? ''
              : (_success ? 'Succesfully registered ' + _userEmail : 'Registration failed' )),
            )
          ]
      )
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void _register() async {
    final FirebaseUser user =  await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text
    );

    if(user == null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
        Navigator.pushNamed(context, '/browseGames');
      });
    } else {
      _success = false;
    }
  }
}
