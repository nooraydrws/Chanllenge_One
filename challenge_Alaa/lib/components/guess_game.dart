import 'package:flutter/material.dart';
import 'package:guess_num/util/questions_generator_engine.dart';

class GuessGame extends StatefulWidget {
  GuessGame({Key key}) : super(key: key);

  @override
  _GuessGameState createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  // --
  bool showStatus = true;

  String newQuestion = "";
  String changeQuestion = "";
  /* ********************* */
  String newAns1 = "";
  String newAns2 = "";
  String newAns3 = "";
  String correctAnswer = "";
  /* ********************* */
  int wrongAnswers = 0;
  int rightAnswers = 0;
  String winner = "";
  /* ********************* */

  List<String> lastQestionsLst = List<String>();

  void playWinLoseState() {
    if (wrongAnswers > rightAnswers) {
      winner = "Loser";
    } else if (wrongAnswers == rightAnswers) {
      winner = "Tide";
    } else {
      winner = "Win";
    }
  }

  /* ********************* */
  int outQuestNo = -1;
  bool _enabled = false;
  Color ansColor;
  String answerChoice = "";
  /* ********************* */
  void _visibleState(bool visibility) {
    setState(() {
      showStatus = visibility;
    });
  }

  /* ********************* */
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bk.png"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                // ROW
                // Generate New Question
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FlatButton(
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(16.0),
                          onPressed: () {
                            setState(() {
                              QuestionsGenerator quesGen = QuestionsGenerator();
                              newQuestion = quesGen.getQuestionTxt;

                              newAns1 = quesGen.ansSuggested.questionAnswer1;
                              newAns2 = quesGen.ansSuggested.questionAnswer2;
                              newAns3 = quesGen.ansSuggested.questionAnswer3;

                              correctAnswer = quesGen.getQesCorrectAnswerTxt;
                              // showStatus = true;
                              _enabled = true;
                            });
                          },
                          child: Text(
                            'Get New Question',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Center(
                // ROW
                // Q U E S T I O N   T E X T
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        //if (showStatus == true)
                        FlatButton(
                          color: Colors.green,
                          textColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                          ), //.all(-30.0),
                          onPressed: null,
                          child: Text(
                            '$newQuestion',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: null,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                // ROW
                // Answers Suggestions
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        answerSuggList(
                          colorBtn: Colors.purple[300],
                          myTextColor: Colors.white,
                          myPadding: EdgeInsets.all(10.0),
                          answerChoice: ('$newAns1'),
                          newAnsParam: Text(
                            '$newAns1',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        answerSuggList(
                          colorBtn: Colors.purple[300],
                          myTextColor: Colors.white,
                          myPadding: EdgeInsets.all(10.0),
                          answerChoice: ('$newAns2'),
                          newAnsParam: Text(
                            '$newAns2',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //if (showStatus == true)
                        answerSuggList(
                          colorBtn: Colors.purple[300],
                          myTextColor: Colors.white,
                          myPadding: EdgeInsets.all(10.0),
                          answerChoice: ('$newAns3'),
                          newAnsParam: Text(
                            '$newAns3',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: null,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                // ROW
                // Wrong / Right Btns
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Column
                    // Wrong Button
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        wronRightAnsBtn(
                          colorBtn: Colors.lightGreen,
                          myPadding: EdgeInsets.all(15.0),
                          myTextColor: Colors.white,
                          txtResultParam: Text(
                            'Wrong Answers   ( $wrongAnswers )',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                    // Column
                    // Right Button
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.lightGreen,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          onPressed: () {
                            // _changed(false);
                            //print('Right Answers []');
                          },
                          child: Text(
                            'Right Answers    ( $rightAnswers )  ',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget answerSuggList(
      {Color colorBtn,
      EdgeInsetsGeometry myPadding,
      Color myTextColor,
      String answerChoice,
      Text newAnsParam}) {
    return FlatButton(
      color: colorBtn,
      textColor: myTextColor,
      padding: myPadding,
      onPressed: _enabled
          ? () {
              setState(() {
                if (answerChoice == correctAnswer) {
                  rightAnswers++;
                } else {
                  wrongAnswers++;
                }
                _enabled = false;
                playWinLoseState();
              });
              //  _visibleState(false);
            }
          : null,
      child: newAnsParam,
    );
  }

  Widget wronRightAnsBtn({
    Color colorBtn,
    EdgeInsetsGeometry myPadding,
    Color myTextColor,
    Text txtResultParam,
    String theAnswer,
  }) {
    return FlatButton(
      color: colorBtn,
      textColor: myTextColor,
      padding: myPadding,
      onPressed: () {
        // _changed(false);
        //print('Right Answers []');
      },
      child: txtResultParam,
    );
  }
}
