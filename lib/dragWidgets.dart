import 'package:flutter/material.dart';
import 'domains.dart';

class TrashCanWidget extends StatelessWidget {
  final String imageUrl;
  final TrashCan item;

  final Function onSuccess;
  final Function onFailure;

  TrashCanWidget(
      {Key key, this.imageUrl, this.item, this.onFailure, this.onSuccess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<TrashCan>(
      builder: (context, incoming, rejected) {
        return Container(
          margin: EdgeInsets.only(top: 30),
          child: Image.asset(imageUrl, height: 200, fit: BoxFit.fitHeight),
        );
      },
      onAccept: (data) {
        if (data == item && onSuccess != null) onSuccess();
        if (data != item && onFailure != null) onFailure();
      },
    );
  }
}

class TrashWidget extends StatelessWidget {
  final TrashItem item;

  TrashWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<TrashCan>(
      data: item.lixeira,
      child: Image.asset(item.imageUrl, height: 100,),
      feedback: Image.asset(item.imageUrl, height: 100,),
      childWhenDragging: Text(
        '♻',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}