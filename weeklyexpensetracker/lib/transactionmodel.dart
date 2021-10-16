class Transaction{
  final String _id;
  final String _title;
  final double _amount;
  final DateTime _dateTime;

  Transaction(this._id,this._title,this._amount,this._dateTime);

  String get id{
    return this._id;
  }
   String get title{
    return this._title;
  }
  double get amount{
    return this._amount;
  }
  
   DateTime get dateTime{
    return this._dateTime;
  }
}