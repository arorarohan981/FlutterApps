import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPercentageOftotal;

  ChartBar(this.label, this.spending, this.spendingPercentageOftotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraint){
      return Column(
      
      children: [
        Container(height: constraint.maxHeight*0.15,child: FittedBox(child: Text('Rs. ${this.spending.toStringAsFixed(2)}'))),//Avoids line Break and shrinks the value if the value/width is more

        SizedBox(
         height: constraint.maxHeight*0.05,
        ),
        Container(
          height: constraint.maxHeight*0.6,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(heightFactor: spendingPercentageOftotal,child: Container(decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),),)
            ],
          ),
        ),
        SizedBox(
          height: constraint.maxHeight*0.05,
        ),
        Text(label,style: TextStyle(height: constraint.maxHeight*0.15),)
      ],
    );
  });}


 
    
}