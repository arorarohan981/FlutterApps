import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
final List<Map<String,Object>> _questions;
final Function _answeredQuestion;
final int _questionIndex;
Quiz( this._questions,this._answeredQuestion,this._questionIndex);


  @override
  Widget build(BuildContext context) {
    return Column(
                    children: [
                      Question(_questions[_questionIndex]['questionText']
                          .toString()), //.toString() or as String we tell dart it will never be null
                      ...(_questions[_questionIndex]['answers'] as List<Map<String,Object>>)
                          .map((currentele) {
                        return Answer(()=>_answeredQuestion(currentele['score']), currentele['text'].toString());
                      }).toList() //As it gives a list of answers components.
                      //Spread operator ... - gives here all values supplied to it.
                      // RaisedButton(
                      //     child: Text('Coffee'),
                      //     onPressed:_answeredQuestion1,
                      //         ), //Used Raised Button or Elevated Butoon . Both are alternatives of each other.
                      // RaisedButton(child: Text('Tea'), onPressed: _answeredQuestion1),
                    ],
                  );
  }
}