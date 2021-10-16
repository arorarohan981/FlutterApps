import "package:flutter/material.dart";
import 'package:weeklyexpensetracker/transactionmodel.dart';
import './transactionmodel.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String,Object>> get groupedTransactions{
    return List.generate(7, (index)  {
        final weekDay=DateTime.now().subtract(Duration(days: index));
        double sum=0;
        for(int i=0;i<recentTransaction.length;i++){
          if(recentTransaction[i].dateTime.day == weekDay.day && recentTransaction[i].dateTime.month == weekDay.month && recentTransaction[i].dateTime.year == weekDay.year){
            sum=sum+recentTransaction[i].amount;
          }
        }
        return {'day':DateFormat.E().format(weekDay).substring(0,3),'amount':sum};
    }).reversed.toList();
  }

  double get maxSpendingperWeek{
      return groupedTransactions.fold(0.0, (sum, element) {
        return sum+(element['amount'] as double); }); 
  }

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 5,margin: EdgeInsets.all(20),
    child: Container(padding: EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [...groupedTransactions.map((data){
        return Flexible (fit:FlexFit.tight//USe the avaialble space.Every child will have the same setting
        ,child: ChartBar(data['day'] as String, data['amount'] as double,  (data['amount']==0)?
          0
          :
        (data['amount'] as double)/maxSpendingperWeek));}
          
          )]),
    ));
  }
}