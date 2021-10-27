import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weeklyexpensetracker/newtransaction.dart';
import 'package:weeklyexpensetracker/transactionlist.dart';
import "./newtransaction.dart";
import "./transactionmodel.dart";
import './chart.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

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
  bool _showChart=true;

  
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

    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final PreferredSizeWidget appBar=Platform.isIOS? CupertinoNavigationBar(middle: Text('Expense Tracker'),trailing:Row(
      children: [
        GestureDetector(child: Icon(CupertinoIcons.add),onTap:() { _startAddNewTransaction(context);},),
    
      ],
      mainAxisSize: MainAxisSize.min,//Takes only as much is required.
    ),):AppBar(
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
      ) as PreferredSizeWidget;

      final transactionList =  TransactionList(_usertransaction,_deleteTransaction);
      final transactionChart = Chart(_usertransaction);
    // return Scaffold(
    //   appBar: appBar,
    //   body: SingleChildScrollView(
    //     child: Column(
    //       // mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         isLandscape ? 
    //         Column(
    //           children: [
    //             Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             const Text('Show Chart'),
    //             Switch(value: _showChart, onChanged:(val){
    //               setState(() {
    //                 _showChart=val;
    //               });
    //             }),]),
    //           Column(
    //             children: [
    //               _showChart ? transactionChart
    //               :transactionList,
    //             ])
          
    //         ]):
    //       Container(child: transactionChart,height: (MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom)*0.3,)
    //       ,Container(child: transactionList,height: (MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom)*0.6,)
    //         ,
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     child: Icon(Icons.add),
    //     onPressed: () {
    //       _startAddNewTransaction(context);
    //     },
    //   ),
    // );
    final pageBody= SafeArea(child:  SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Show Chart',style: Theme.of(context).textTheme.headline6,),
                  Switch.adaptive(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: transactionChart,
              ),
            if (!isLandscape) transactionList,
            if (isLandscape) _showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child: transactionChart,
                  )
                : transactionChart
          ],
        ),
      ));

    return Platform.isIOS ? CupertinoPageScaffold (navigationBar: appBar as ObstructingPreferredSizeWidget,child: pageBody,): Scaffold(
      appBar: appBar,
      body: pageBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS ? Container(): FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
