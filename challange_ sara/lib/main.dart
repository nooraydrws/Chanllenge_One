import 'dart:math';
import 'dart:ui';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Challenge(),
    );
  }
}

class Challenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'هيّا لنتعلمـ الحروف',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontFamily: 'hacen',
          ),
        ),
        centerTitle: true,
      ),
      body: BodyChallenge(),
    );
  }
}

class BodyChallenge extends StatefulWidget {
  @override
  _BodyChallengeState createState() => _BodyChallengeState();
}

class _BodyChallengeState extends State<BodyChallenge> {
  int letterNumber = 1;
  int audioNumber = 1;
  AudioCache audioPlayer = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
          onPressed: () {
            setState(() {
              audioPlayer.play('audios/audio$audioNumber.mp3');
              letterNumber = Random().nextInt(5) + 1;
              audioNumber = letterNumber;
            });
          },
          child: Image.asset('assets/images/alpha$letterNumber.png')),
    );
  }
}
