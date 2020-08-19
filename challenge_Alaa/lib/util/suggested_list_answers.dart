import 'package:guess_num/models/suggested_answers.dart';

class SuggestedAnswersList {
  List<SuggestedAnswers> _ansSugArr = [
    SuggestedAnswers(
        questionAnswerLoc: 2,
        questionAnswer1: 'English Writer',
        questionAnswer2: 'War Leader',
        questionAnswer3: 'Goal Keeper'),
    SuggestedAnswers(
        questionAnswerLoc: 1,
        questionAnswer1: 'Mohammed',
        questionAnswer2: 'Guess',
        questionAnswer3: 'Moses'),
    SuggestedAnswers(
        questionAnswerLoc: 1,
        questionAnswer1: 'Paris',
        questionAnswer2: 'London',
        questionAnswer3: 'Cairo'),
    SuggestedAnswers(
        questionAnswerLoc: 2,
        questionAnswer1: 'Amazon River',
        questionAnswer2: 'Nile River',
        questionAnswer3: 'Forat River'),
    SuggestedAnswers(
        questionAnswerLoc: 3,
        questionAnswer1: 'German',
        questionAnswer2: 'Arjantin',
        questionAnswer3: 'France'),
    SuggestedAnswers(
        questionAnswerLoc: 3,
        questionAnswer1: 'USA',
        questionAnswer2: 'China',
        questionAnswer3: 'Germany'),
    SuggestedAnswers(
        questionAnswerLoc: 2,
        questionAnswer1: 'Jeddah',
        questionAnswer2: 'Riyadh',
        questionAnswer3: 'Dammam'),
    SuggestedAnswers(
        questionAnswerLoc: 1,
        questionAnswer1: 'Africa',
        questionAnswer2: 'Asia',
        questionAnswer3: 'Europ'),
    SuggestedAnswers(
        questionAnswerLoc: 2,
        questionAnswer1: 'South Amarica',
        questionAnswer2: 'Europ',
        questionAnswer3: 'Africa')
  ];

  SuggestedAnswers getSuggQesList(int x) => _ansSugArr[x];
}
