import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class CurrentQuizPage extends StatefulWidget {
  @override
  _CurrentQuizPageState createState() {
    // TODO: implement createState
    return _CurrentQuizPageState(quizGame: 'Test');
  }
}

class _CurrentQuizPageState extends State<CurrentQuizPage> {
  String quizGame;
  String barcode = "";

  _CurrentQuizPageState({this.quizGame});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Page'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30, left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 8,
                  child: Text(
                    this.quizGame,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Icon(Icons.settings, size: 30),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, right: 10, left: 10),
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            color: Colors.grey,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent placerat auctor luctus. Suspendisse dictum non enim nec porttitor. Quisque vitae ante vitae neque iaculis iaculis ut sit amet ipsum. Vivamus eget ipsum nec dolor porta vehicula. Fusce eleifend in massa at varius. Donec viverra pellentesque eleifend. ",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: RaisedButton(
              color: Colors.lightBlue,
              child: Text(
                'Scan QR Code',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                scan();
              },
            ),
          ),
          (this.barcode != null) ? Text(this.barcode) : Text('Error'),
        ],
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
