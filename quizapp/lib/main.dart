import 'package:flutter/material.dart';
import "./quiz.dart";
import "./result.dart";

void main() {
  runApp(
      MyApp()); //Return by Flutter.Written in Material.dart.Take our widget Tree and create UI for us.
  //it calls Build method for us.
}

//Each and every class inheritance from a base class of widget named StatelessWidget
// class MyApp extends StatelessWidget {//Here it cant have state
class MyApp extends StatefulWidget //when the state changes it re renders.
{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //State is a generic class from dart.Here if data changes / state changes.Only Chnaged data or part is rerendered
  int _questionIndex = 0;

  final _questions = [
    {
      'questionText': ' Who was the first Indian woman in Space?',
      'answers': [{'text':'Kalpana Chawla','score':10}, {
        'text':'Sunita Williams','score':0}, {'text':'Koneru Humpy','score':0},{'text':'None of the above','score':10}],
    },
    {
      'questionText': 'Who was the first Man to Climb Mount Everest Without Oxygen?',
      'answers': [{'text':'Junko Tabei','score':0}, {'text':'Reinhold Messner','score':0}, {'text':'Peter Habeler','score':0},{'text': 'Phu Dorji','score':10}],
    },
    {
      'questionText': 'Who was the first Indian Scientist to win a Nobel Prize?',
      'answers': [{'text':'CV Raman','score':10}, {'text':'Amartya Sen','score':0},{'text': 'Hargobind Khorana','score':0},{'text':'Subramanian Chrandrashekar','score':0}],
    },
    {
      'questionText': 'Who was the first Indian to win the Booker Prize?',
      'answers': [{'text':'Dhan Gopal Mukerji','score':0},{'text': 'Nirad C. Chaudhuri','score':0},{'text': 'Arundhati Roy','score':10},{'text':'Aravind Adiga','score':0}],
    },
  ];
  int _totalscore=0;
  void _answeredQuestion(int score) {
    _totalscore=_totalscore+score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }
  void _restartQuiz(){
    setState(() {
      _totalscore=0;
    _questionIndex=0;
    });
    
  }
  @override //Decorator provided by Dart.
  Widget build(BuildContext context) {
    //Context is passed automatically by Flutter.It has meta info about our app.
    //build Method is called by flutter to draw something on Screen
    //  return MaterialApp(home: Text('Quiz App'));//Does some base setup for us .
    //Home : core widget flutter brings to the Screen.
    //Text is a Widget . We can customize it later.
    //No default Styling . We have to configure it .

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Quiz App'),
            ), //Take a Preferred SIze widget . AppBar() is by Material Dart.
            body: _questionIndex < _questions.length
                ? Quiz(_questions,_answeredQuestion,_questionIndex)
                : Result(_totalscore,_restartQuiz))); //Scaffold is a material dart widget . It Creates a base design for our App.
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
