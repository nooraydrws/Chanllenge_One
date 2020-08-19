import 'dart:math';
import 'package:guess_num/models/questions.dart';
import 'package:guess_num/util/questions_list.dart';
import 'package:guess_num/models/suggested_answers.dart';
import 'package:guess_num/util/suggested_list_answers.dart';

class QuestionsGenerator {
  //*********************** */

  String getQuestionTxt;
  String getQesCorrectAnswerTxt;

  // Classes Instance
  Questions question = Questions();
  Questionlist qList = Questionlist();

  SuggestedAnswers ansSuggested = SuggestedAnswers();
  SuggestedAnswersList sugQuesAnsList = SuggestedAnswersList();

  //QuestionsCorrectAns quesCorrectAnswer = QuestionsCorrectAns();

  // Constractor
  QuestionsGenerator() {
    getNewQuestion();
  }

  //-----------------------------------------------
  // Get New Question
  // Method getNewQuestion
  // ---
  void getNewQuestion() {
    //--
    // Get Class of  [ Questions ] Instance
    List<Questions> qesList = qList.getAllQestionList();

    // Get List of Question Length
    int getQesListLen = qesList.length;

    // Get  [ Question INDEX ] Using Random Function
    int _newQusIndex = Random().nextInt(getQesListLen);

    // Get New  [ Question ]
    getQuestionTxt = getQuestion(_newQusIndex);

    // Get New  [ Question ]  Suggested Answers ...
    ansSuggested = quesSuggAnswerList(_newQusIndex);

    // Get Question [ Correct Answer ]
    getQesCorrectAnswerTxt = getQusCorrectAnswer(_newQusIndex);
    // --
  } // End getNewQuestion ...

  //* ******************************************* */
  //     Get Question   [ Method ]
  // -
  String getQuestion(int _newQusIndex) {
    //-
    question = qList.getQestionFromList(_newQusIndex);
    return question.questionIs;
  }

  //* ******************************************* */
  //  Get Question Suggested Answers  ...
  //  [ Method ] ...
  // -
  SuggestedAnswers quesSuggAnswerList(int newQesIndx) =>
      sugQuesAnsList.getSuggQesList(newQesIndx);

  //* ******************************************* */
  //  Get Question [ Correct Answer ]
  //   [ Method ] ...
  // -
  String getQusCorrectAnswer(int _newQuestIndex) {
    //-
    int getCorrectAnsLoc = ansSuggested.questionAnswerLoc;

    switch (getCorrectAnsLoc) {
      case 1:
        getQesCorrectAnswerTxt = ansSuggested.questionAnswer1;
        break;
      case 2:
        getQesCorrectAnswerTxt = ansSuggested.questionAnswer2;
        break;
      case 3:
        getQesCorrectAnswerTxt = ansSuggested.questionAnswer3;
        break;
    }

    // Return String  [ Correct Answer ]
    return getQesCorrectAnswerTxt;
  }
}
