import 'package:flutter/material.dart';
import 'package:recicla_plus/endScreen.dart';
import 'package:recicla_plus/game.dart';

import 'startScreen.dart';
import 'game.dart';
import 'endScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PressStart',
      ),
      home: StartScreen(),
      routes: {
        '/game': (context) => ReclicaGame(),
        '/points': (context) => EndScreen(),
      },
    );
  }
}
