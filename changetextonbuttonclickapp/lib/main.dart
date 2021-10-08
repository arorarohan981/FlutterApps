import 'package:flutter/material.dart';
import './textdynamic.dart';
import "./button.dart";
void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }   
}

class _MyAppState extends State<MyApp> {
  bool _togglevar=true;

  void changeQuote(){
    setState(() {
      if(_togglevar){
        _togglevar=false;
      }else{
        _togglevar=true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Dynamic Text App'),
            ),
            body:Column(children: [Dynamictext(_togglevar),button(() { changeQuote();})],
            )
              // Dynamictext(_togglevar),
              // button(() => changeQuote() ))]
            
   ));
  }
}
