import 'package:flutter/material.dart';
import 'package:project1/page_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: customAppBar(),
      body: Body1(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page2()));
        },
        backgroundColor: Colors.white,
        child: Text('إبدأ',
            style: TextStyle(color: Colors.teal.shade700, fontSize: 30.0)),
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'الصفحة الرئيسية لمنصة تقني ',
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
            radius: 170.0,
            backgroundImage: AssetImage('assets/images/homepage.jpg'),
          ),
          Text(
            'منصة تقني للتدريب والتصميم',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          Text(
            'مرحبا بكم ',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
