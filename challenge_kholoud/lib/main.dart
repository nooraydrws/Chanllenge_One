import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Jungle Book',
      debugShowCheckedModeBanner: false,
      home: JungleBook(),
    );
  }
}

// ignore: must_be_immutable
class JungleBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFcc8800),
        centerTitle: true,
        title: Text(
          'The Jungle Book',
          style: GoogleFonts.grenze(
            textStyle: TextStyle(
              color: Color(0xFF664400),
              fontSize: 30,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              wordSpacing: 8,
            ),
          ),
        ),
      ),
      body: JungleBody(),
    );
  }
}

class JungleBody extends StatefulWidget {
  @override
  _JungleBodyState createState() => _JungleBodyState();
}

class _JungleBodyState extends State<JungleBody> {
  static AudioCache player = new AudioCache();
  var animalNames = ['Lion', 'Duck', 'Elephant', 'Cat', 'Sheep', 'Hen'];
  int animal = 1;
  String audioPath = 'audios/animal1.mp3';
  String name = 'Lion';
  @override
  Widget build(BuildContext context) {
    playAniamlAudio(theAudioPath: audioPath);
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Color(0xFFfff7e6),
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          animalName(theName: name),
          animalPhoto(animalNumber: animal),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              previousButton(),
              nextButton(),
            ],
          ),
        ],
      ),
    );
  }

  Text animalName({@required String theName}) {
    return Text(
      '$name',
      style: GoogleFonts.sanchez(
        textStyle: TextStyle(
          color: Color(0xFF664400),
          fontSize: 60,
          fontWeight: FontWeight.w700,
          letterSpacing: 5,
        ),
      ),
    );
  }

  Image animalPhoto({@required int animalNumber}) {
    return Image.asset(
      'assets/images/animal$animalNumber.png',
      width: 250,
      height: 250,
    );
  }

  playAniamlAudio({@required String theAudioPath}) => player.play(theAudioPath);

  FlatButton nextButton() {
    return FlatButton(
      onPressed: () {
        nextAnimal();
      },
      child: Image.asset(
        'assets/images/next.png',
        width: 100,
        height: 60,
      ),
    );
  }

  FlatButton previousButton() {
    return FlatButton(
      onPressed: () {
        previousAnimal();
      },
      child: Image.asset(
        'assets/images/previous.png',
        width: 100,
        height: 60,
      ),
    );
  }

  Future<void> previousAnimal() async {
    setState(() {
      animal = animal - 1;
      if (animal == 0) {
        animal = 6;
      }
      audioPath = 'audios/animal$animal.mp3';
      name = animalNames[animal - 1];
    });
  }

  Future<void> nextAnimal() async {
    setState(() {
      animal = animal + 1;
      if (animal == 7) {
        animal = 1;
      }
      audioPath = 'audios/animal$animal.mp3';
      name = animalNames[animal - 1];
    });
  }
}
