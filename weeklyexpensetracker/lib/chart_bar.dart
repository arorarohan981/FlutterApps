import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double spendingPercentageOftotal;

  ChartBar(this.label, this.spending, this.spendingPercentageOftotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Container(height: 20,child: FittedBox(child: Text('Rs. ${this.spending.toStringAsFixed(2)}'))),//Avoids line Break and shrinks the value if the value/width is more

        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
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
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
