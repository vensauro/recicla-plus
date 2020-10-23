import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      color: Color(0xFF00D8E7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/logo.jpg',
          ),
          MaterialButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/game'),
            child: Text('COMEÇAR'),
            color: Colors.blue[100],
            padding: EdgeInsets.all(20),
          ),
        ],
      ),
    );
  }
}
