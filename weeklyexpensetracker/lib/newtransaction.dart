import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final _addtransaction;
  NewTransaction(this._addtransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textEditingController = TextEditingController();

  final amountEditingController = TextEditingController();
   DateTime _selectedDate=DateTime.now();
   
  void _PresentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((date) {
          if(date==null){
            return;
          }else{
            setState(() {
              _selectedDate=date;
            });

          }
        }
            
            ); //then will call the function which will be executed when user choose the date.Future object is returned by showDatePicker
  }

  void submitData() {
    String inputtitle = textEditingController.text;
    double amount = double.parse(amountEditingController.text);
    if (inputtitle.isEmpty || amount <= 0) {
      return;
    }
    widget._addtransaction(inputtitle, amount,_selectedDate);

    Navigator.of(context).pop(); //Closes the Modal Sheet.
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                autocorrect: true,
                decoration: InputDecoration(labelText: 'Title'),
                controller: textEditingController,
              ),
              TextField(
                autocorrect: true,
                controller: amountEditingController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Amount'),
                onSubmitted: (_) {
                  //_ :We are not using the argument.
                  submitData();
                },
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text(_selectedDate==null ? 'No date Chosen' :DateFormat.yMd().format(_selectedDate)),
                    ElevatedButton(
                      onPressed: _PresentDatePicker,
                      child: Text('Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                      onPressed: submitData,
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(color: Colors.black),
                      )))
            ],
          )),
    );
  }
}
