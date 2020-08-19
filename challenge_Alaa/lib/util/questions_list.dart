import 'package:guess_num/models/questions.dart';

class Questionlist {
  List<Questions> _quesList = [
    Questions(
      questionIs: 'Napoleon Bonaparte?',
    ),
    Questions(
      questionIs: 'Name of Islam Profit?',
    ),
    Questions(
      questionIs: 'Capital of France?',
    ),
    Questions(
      questionIs: 'Longest River?',
    ),
    Questions(
      questionIs: '2018 Footboal World Cup?',
    ),
    Questions(
      questionIs: 'Marcedice Made Country?',
    ),
    Questions(
      questionIs: 'Capital of Saudi Arabia?',
    ),
    Questions(
      questionIs: 'Which Continant have Egypt Country?',
    ),
    Questions(
      questionIs: 'Portugal Country located in?',
    ),
  ];

  Questions getQestionFromList(int x) => _quesList[x];

  List<Questions> getAllQestionList() => _quesList;
}
