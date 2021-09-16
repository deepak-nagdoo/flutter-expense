import 'package:flutter/material.dart';
import 'package:flutter_sample_app/niyo_theme.dart';

import './widgets/home.dart';

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
        primarySwatch: Colors.purple,
        accentColor: Colors.amberAccent,
        fontFamily: 'Rubik',
        textTheme: NiyoTheme.main(context),
        appBarTheme: NiyoTheme.appBar(),
      ),
      home: Home(),
    );
  }
}
