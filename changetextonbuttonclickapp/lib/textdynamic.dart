import 'package:flutter/material.dart';

class Dynamictext extends StatelessWidget {
  
  final _togglevar;
  var quotes=["You always pass failure on the way to success.",
  "Once you replace negative thoughts with positive ones, you’ll start having positive results."];

  
  Dynamictext(this._togglevar);

  @override
  Widget build(BuildContext context) {
    String texttobedisplayed="";
    if(_togglevar){
      texttobedisplayed=quotes[0];
    }else{
      texttobedisplayed=quotes[1];
    }
    // return Text(texttobedisplayed,style: textalign:TextAlign.center,);
    return Center(child: Text(texttobedisplayed,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)));
  }
}