import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

import 'domains.dart';
import 'dragWidgets.dart';

AudioCache audio = AudioCache();

class ReclicaGame extends StatefulWidget {
  ReclicaGame({Key key}) : super(key: key);

  createState() => ReclicaGameState();
}

class ReclicaGameState extends State<ReclicaGame> {
  int score = 0;

  Map<TrashCan, String> trashesCan;

  TrashItem trashItem;

  // Random seed to shuffle order of items.
  int seed = 0;

  // Timeout
  int _timer = 60;
  int _elapsedTime = 60;

  void startTimer() {
    CountdownTimer(Duration(seconds: _timer), Duration(seconds: 1)).listen(null)
      ..onData((duration) {
        setState(() {
          _elapsedTime = _timer - duration.elapsed.inSeconds;
        });
      })
      ..onDone(() {
        Navigator.pushReplacementNamed(context, '/points', arguments: score);
      });
  }

  Map<TrashCan, String> _getRandomTrashCans() {
    var trashesEntries =
        (trashCanImages.entries.toList()..shuffle(Random(seed++))).take(3);
    return Map.fromEntries(trashesEntries);
  }

  TrashItem _getTrash() {
    var items =
        trashItems.where((item) => trashesCan.containsKey(item.lixeira));
    int randomIndex = Random().nextInt(items.length - 1);
    return items.elementAt(randomIndex);
  }

  @override
  void initState() {
    trashesCan = _getRandomTrashCans();
    trashItem = _getTrash();
    _elapsedTime = 60;
    startTimer();
    super.initState();
  }

  void _onSuccess() {
    setState(() {
      score++;
      trashesCan = _getRandomTrashCans();
      trashItem = _getTrash();
    });
    audio.play('success.mp3');
  }

  void _onFailure() {
    setState(() {
      if (score == 2) score = score - 2;
    });
  }

  Widget _transformEntryToWidget(MapEntry<TrashCan, String> entry) {
    return TrashCanWidget(
      imageUrl: entry.value,
      item: entry.key,
      onFailure: _onFailure,
      onSuccess: _onSuccess,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pontuação $score'),
        backgroundColor: Colors.pink,
        actions: [
          Container(
            child: Center(child: Text(_elapsedTime.toString())),
            padding: EdgeInsets.all(20),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  trashesCan.entries.map(_transformEntryToWidget).toList()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: TrashWidget(item: trashItem),
              ),
            ],
          )
        ],
      ),
    );
  }
}
