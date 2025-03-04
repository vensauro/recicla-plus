import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int score = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
    return Container(
      color: Color(0xFF00D8E7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "SUA PONTUAÇÃO:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  fontFamily: 'PressStart',
                ),
              ),
              Text(
                score.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  fontFamily: 'PressStart',
                ),
              ),
            ],
          ),
          MaterialButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/game'),
            color: Colors.blue[100],
            padding: EdgeInsets.all(20),
            child: Text('TENTAR NOVAMENTE'),
          ),
        ],
      ),
    );
  }
}
