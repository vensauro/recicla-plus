import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'package:recicla_plus/drag_widgets.dart';

import 'domains.dart';

final player = AudioPlayer();

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  createState() => GameState();
}

class GameState extends State<Game> {
  int score = 0;

  late Map<TrashCan, String> trashesCan;

  TrashItem? trashItem;

  // Random seed to shuffle order of items.
  int seed = 0;

  // Timeout
  final int _timer = 60;
  int _elapsedTime = 60;

  void startTimer() {
    CountdownTimer(Duration(seconds: _timer), Duration(seconds: 1)).listen(null)
      ..onData((duration) {
        setState(() {
          _elapsedTime = _timer - duration.elapsed.inSeconds;
        });
      })
      ..onDone(() {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/points', arguments: score);
        }
      });
  }

  Map<TrashCan, String> _getRandomTrashCans() {
    var trashesEntries =
        (trashCanImages.entries.toList()..shuffle(Random(seed++))).take(3);
    return Map.fromEntries(trashesEntries);
  }

  TrashItem _getTrash() {
    var items = trashItems.where(
      (item) => trashesCan.containsKey(item.lixeira),
    );
    int randomIndex = Random().nextInt(items.length - 1);
    return items.elementAt(randomIndex);
  }

  @override
  void initState() {
    super.initState();
    trashesCan = _getRandomTrashCans();
    trashItem = _getTrash();
    _elapsedTime = 60;
    startTimer();
  }

  void _onSuccess() {
    setState(() {
      score++;
      trashesCan = _getRandomTrashCans();
      trashItem = _getTrash();
    });
    player.play(AssetSource('success.mp3'));
  }

  void _onFailure() {
    setState(() {
      if (score >= 2) score = score - 2;
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
            padding: EdgeInsets.all(20),
            child: Center(child: Text(_elapsedTime.toString())),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: trashesCan.entries.map(_transformEntryToWidget).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child:
                    trashItem != null
                        ? TrashWidget(item: trashItem!)
                        : SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
