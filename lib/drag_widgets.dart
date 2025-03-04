import 'package:flutter/material.dart';
import 'domains.dart';

class TrashCanWidget extends StatelessWidget {
  final String imageUrl;
  final TrashCan item;

  final Function onSuccess;
  final Function onFailure;

  const TrashCanWidget({
    super.key,
    required this.imageUrl,
    required this.item,
    required this.onFailure,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<TrashCan>(
      builder: (context, incoming, rejected) {
        return Container(
          margin: EdgeInsets.only(top: 30),
          child: Image.asset(imageUrl, height: 200, fit: BoxFit.fitHeight),
        );
      },
      onAcceptWithDetails: (target) {
        if (target.data == item) onSuccess();
        if (target.data != item) onFailure();
      },
    );
  }
}

class TrashWidget extends StatelessWidget {
  final TrashItem item;

  const TrashWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Draggable<TrashCan>(
      data: item.lixeira,
      feedback: Image.asset(item.imageUrl, height: 100),
      childWhenDragging: Text('♻', style: TextStyle(fontSize: 50)),
      child: Image.asset(item.imageUrl, height: 100),
    );
  }
}
