import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Challenge(),
    );
  }
}

class Challenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Qtoof',
          style: TextStyle(
              fontSize: 40,
              color: Colors.grey,
              fontWeight: FontWeight.w900,
              fontFamily: 'lexend Zetta'),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          size: 35,
          color: Colors.black54,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.people,
              size: 30,
              color: Colors.black54,
            ),
          )
        ],
      ),
      body: BodyChallenge(),
    );
  }
}

class BodyChallenge extends StatefulWidget {
  BodyChallenge({Key key}) : super(key: key);

  @override
  _BodyChallengeState createState() => _BodyChallengeState();
}

class _BodyChallengeState extends State<BodyChallenge> {
  var numberApp = 1;
  var numberCenter = 1;
  var numberDown = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/ccv.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                      onPressed: () {
                        randomNumberApp();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage('assets/images/mk$numberApp.jpg'),
                      ))),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      randomNumberCenter();
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage('assets/images/mh$numberCenter.jpg'),
                    )),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    randomNumberDown();
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        AssetImage('assets/images/cvr$numberDown.jpg'),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                color: Colors.grey,
                child: ListTile(
                  title: Text('966 58 220 3404'),
                  leading: Icon(
                    Icons.phone,
                    color: Colors.black87,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                color: Colors.grey,
                child: ListTile(
                  title: Text('info@qtoofacademy.com'),
                  leading: Icon(Icons.mail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void randomNumberCenter() {
    setState(() {
      numberCenter = Random().nextInt(2) + 1;
    });
  }

  void randomNumberApp() {
    setState(() {
      numberApp = Random().nextInt(2) + 1;
    });
  }

  void randomNumberDown() {
    setState(() {
      numberDown = Random().nextInt(2) + 1;
    });
  }
}
