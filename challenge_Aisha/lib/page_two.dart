import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.teal,
      appBar: customAppBar(),
      body: Body1(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.white,
        child: Text('الرئيسية',
            style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),
      ),
    ));
  }

  AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'خدمات موقع تقني  ',
        style: TextStyle(color: Colors.teal, fontSize: 20.0),
      ),
      centerTitle: true,
    );
  }
}

class Body1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/images/tr.jpg'),
            ),
            Text(
              'البرامج التدريبية ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
            FlatButton(
              onPressed: null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('انقر هنا',
                      style: TextStyle(color: Colors.yellow, fontSize: 20)),
                ],
              ),
            ),
            FlatButton(
              onPressed: null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('assets/images/pentool.jpg')),
                  Text(
                    'خدمات التصميم ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('انقر هنا',
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
