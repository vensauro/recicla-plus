import 'package:flutter/material.dart';
import 'package:recicla_plus/end_screen.dart';
import 'package:recicla_plus/game.dart';
import 'package:recicla_plus/start_screen.dart';

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
