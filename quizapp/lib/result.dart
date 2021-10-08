import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final int _score;
  final VoidCallback _restartQuiz;
  Result(this._score,this._restartQuiz);

  String get ResultPhrase {
     var resultText ;
    resultText = 'Your Score is ' + _score.toString()+' / 40';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(children: [Text(ResultPhrase,style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
      ),FlatButton(textColor:Colors.black,color: Colors.red,onPressed:_restartQuiz, child: Text('Restart Quiz'))])
      
    );
  }
}
// RaisedButton,FlatButton and Outline Button are deprecated.
// //Not recommended to use .
// RaisedButton is replaced by ElevatedButton(Only change is here theme of the apps is inherited in the button)

// FlatButton is replaced by TextButton

// OutlineButton is replaced by OutlinedButton
// All these have style attribute which have more attributes in them.