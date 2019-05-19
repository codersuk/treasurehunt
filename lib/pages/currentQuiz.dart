import 'package:flutter/material.dart';
import 'package:treasurehunt/func/barcode.dart';
import 'package:treasurehunt/func/locate.dart';

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
  int _selectedIndex = 0;
  Map<String, double> userLocation;
  LocateFunction gps = LocateFunction();

  _CurrentQuizPageState({this.quizGame});

  @override
  void initState() {
    gps.ins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabArray = <Widget>[this.main(), this.team(), Text('test2')];

    return Scaffold(
        appBar: AppBar(
          title: Text('Quizz'),
        ),
        body: tabArray.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.pages), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), title: Text('Users')),
            BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Maps')),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget main() {
    return Column(
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
              Barc();
            },
          ),
        ),
        (this.barcode != null) ? Text(this.barcode) : Text('Error'),
        Container(
          child: RaisedButton(
            color: Colors.redAccent,
            child: Text(
              'Get GPS',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            onPressed: () {
              getLocation();
            },
          ),
        ),
        (this.userLocation != null)
            ? Text(userLocation['latitude'].toString() +
                ", " +
                userLocation['longitude'].toString())
            : Text('Error')
      ],
    );
  }

  Future<void> getLocation() async {
    Map<String, double> ss = await gps.getloc();

    print(ss);

    setState(() {
      userLocation = ss;
    });
  }

  Widget team() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(top: 30, left: 20, right: 30),
            child: Text(
              'Teams',
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
//            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(30),
            color: Colors.blueGrey,
            child: Text(
              '1233',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            height: 300,
            child: ListView(children: users()),
          ),
        )
      ],
    );
  }

  List<Widget> users() {
//    Todo get a list of users
    List<String> userList = [
      'Kaps',
      'olivia',
      'Joe',
      'Stephen',
      'Sumia',
      'olivia',
      'Joe',
      'Stephen',
      'Sumia'
    ];

    List<ListTile> a = userList.map((f) {
      return ListTile(
        leading: Icon(Icons.map),
        subtitle: Text('Joined on 22/22/11'),
        title: Text(f),
      );
    }).toList();

    return a;
  }

//  Using my own func/barcode.dart to return the barcode easily. no mess
//  author: B.Ramburn
  Future Barc() async {
    String a = await BarCodeScanner().barCode;
    setState(() {
      barcode = a;
    });
  }
}
