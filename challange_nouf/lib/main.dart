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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyGame(),
    );
  }
}

class MyGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock, Paper, Scissors'),
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.greenAccent.shade100,
      body: BodyGame(),
    ); // ربطته بعد ما سوينا ستيت فل واخذت محتوى ال بودي
  }
}

class BodyGame extends StatefulWidget {
  BodyGame({Key key}) : super(key: key);

  @override
  _BodyGameState createState() => _BodyGameState();
}

class _BodyGameState extends State<BodyGame> {
  int black = 1;
  int white = 2;
  int blackScore = 0;
  int whiteScore = 0; // inetial values

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10)),
          pressButton(imagePath: 'assets/images/black$black.png'),
          pressButton(imagePath: 'assets/images/white$white.png'),
          Text(' Black Score:$blackScore'),
          Text(' White Score:$whiteScore'),
          resetPutton(blackScore, whiteScore),
        ],
      ),
    ));
  }

  Widget pressButton({
    String imagePath,
  }) {
    return Expanded(
      child: FlatButton(
          onPressed: () {
            randomNumber();
            winner();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Image.asset(imagePath),
              ),
            ],
          )),
    );
  }

  Widget resetPutton(int blackScore, int whiteScore) {
    //flex: 10,
    return Center(
      child: FlatButton(
          onPressed: () {
            reset();
          },
          child: Center(
            child: Icon(
              Icons.refresh,
              size: 70.0,
            ),
          )),
    );
  }

  void randomNumber() {
    setState(() {
      black = Random().nextInt(3) + 1;
      white = Random().nextInt(3) + 1;
    });
  }

  void winner() {
    if (black == 1 && white == 2 ||
        black == 2 && white == 3 ||
        black == 3 && white == 1)
      blackScore++;
    else if (black == 2 && white == 1 ||
        black == 3 && white == 2 ||
        black == 1 && white == 3)
      whiteScore++;
    else if (white == black) {
      whiteScore = whiteScore + 0;
      blackScore = blackScore + 0;
    }
  }

  void reset() {
    setState(() {
      blackScore = 0;
      whiteScore = 0;
    });
  }
}
