import 'package:flutter/material.dart';
import 'package:recicla_plus_2/end_screen.dart';
import 'package:recicla_plus_2/game.dart';
import 'package:recicla_plus_2/start_screen.dart';

void main() {
  runApp(const ReciclaPlusApp());
}

class ReciclaPlusApp extends StatelessWidget {
  const ReciclaPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PressStart',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: StartScreen(),
      routes: {
        '/game': (context) => Game(),
        '/points': (context) => EndScreen(),
      },
    );
  }
}
