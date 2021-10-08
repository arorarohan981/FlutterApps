import "package:flutter/material.dart";

class button extends StatelessWidget {
  VoidCallback _changeState;
  button(this._changeState);
  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(child:Text('Click Me To Change the Quote'),onPressed: _changeState,
    style: ElevatedButton.styleFrom(primary: Colors.pink,
    padding: EdgeInsets.all(20),
    ),
  
    ));
  }
}