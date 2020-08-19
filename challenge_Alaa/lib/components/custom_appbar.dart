import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Title(color: Colors.white, child: Text('Guess Game')),
  );
}
