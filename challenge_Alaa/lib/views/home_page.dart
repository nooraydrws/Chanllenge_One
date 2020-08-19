import 'package:flutter/material.dart';
import 'package:guess_num/components/custom_appbar.dart';
import 'package:guess_num/components/guess_game.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: GuessGame(),
      ),
    );
  }
}
