import 'package:flutter/material.dart';
import 'package:weeklyexpensetracker/newtransaction.dart';
import 'package:weeklyexpensetracker/transactionlist.dart';
import "./newtransaction.dart";
import "./transactionmodel.dart";
import './chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekly Expense Tracker',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.black,
          fontFamily: 'Quicksand' //Default Font
          ,
          errorColor: Colors.red,
          appBarTheme: AppBarTheme(
              //Here all texts in app bar will get this theme
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans')),
                      )), //Accent is a Alternate Color.

      //Differnce between primary Swatch and Primary Color is that Primary COlors is a single Color.Where as Swatch
      //generates related colours.

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
//   String titleInput="";
// String amountInput="";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _usertransaction = [];

  List<Transaction> get _recentTransaction{
    return _usertransaction.where((element)
     { return element.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));}
    ).toList();
  }
  void _addtransaction(String title, double amount,DateTime date) {
    final newTx =
        Transaction(DateTime.now().toString(), title, amount, date);
    setState(() {
      _usertransaction.add(newTx);
    });
  }

  void _deleteTransaction(String id){
      setState(() {
        _usertransaction.removeWhere((element){

         return element.id==id;
      });
  });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addtransaction),
            onTap: () {},
          );
          //Builder need to be a widget which inside a modal body.
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weekly Expense Tracker',
        ),
        actions: [
          IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Chart(_usertransaction),
            TransactionList(_usertransaction,_deleteTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
