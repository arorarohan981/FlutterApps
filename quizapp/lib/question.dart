import 'package:flutter/material.dart';

@immutable
class Question extends StatelessWidget {
  final String _question;

  const Question(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,//this takes full width of the screen
      margin:EdgeInsets.all(10),
        child: Text(
      _question,
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
    )

        //Text Align is enum internally
        //By Default Text Widget takes only that much place how much it needs.
        );
  }
}
