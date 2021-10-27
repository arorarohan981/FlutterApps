import 'package:flutter/material.dart';
import "./transactionmodel.dart";
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _usertransaction;
  Function _deleteTx;
  TransactionList(this._usertransaction,this._deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
       
        child: _usertransaction.isEmpty
            ? Image.asset(
                'assets/fonts/images/waiting.jpg',
                fit: BoxFit.cover,
              )
            : ListView.builder(
                itemBuilder: (ctx, pos) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Text('Rs. ${_usertransaction[pos].amount}'),
                      ),
                      title: Text(
                        '${_usertransaction[pos].title}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      subtitle: Text('${_usertransaction[pos].dateTime}',
                          style: Theme.of(context).textTheme.caption),
                      trailing: IconButton(
                        onPressed: (){
                          _deleteTx(_usertransaction[pos].id);
                        },
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                },
                itemCount: _usertransaction.length,
              ));
  }
}
