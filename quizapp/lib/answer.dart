import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _Answertext;
  final VoidCallback AnswerFunction;
  Answer(this.AnswerFunction,this._Answertext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey,
      child:RaisedButton(child:Text(this._Answertext), onPressed:AnswerFunction),
      margin: EdgeInsets.all(10),
      
    );
  }
}
