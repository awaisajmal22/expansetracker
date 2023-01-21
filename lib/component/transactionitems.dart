import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/text.dart';
import '../models/transaction.dart';

class TransactionItems extends StatefulWidget {
  const TransactionItems({
    required Key key,
    required Transaction userTransaction,
    required bool showChart,
    required this.delete,
  }) : _userTransaction = userTransaction, _showChart = showChart, super(key: key);

  final Transaction _userTransaction;
  final bool _showChart;
  final Function delete;

  @override
  State<TransactionItems> createState() => _TransactionItemsState();
}

class _TransactionItemsState extends State<TransactionItems> {
  late Color _bgColor;
  
  @override
  void initState() {
    const avaliableColors = [Colors.red,Colors.amber,Colors.black12];
    _bgColor = avaliableColors[Random().nextInt(3)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black38,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: _bgColor,
            shape: BoxShape.circle,
            boxShadow: shadowforContainer,
          ),
          height: 60,
          width: 60,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('\$${widget._userTransaction.amount}',
              style: style,
              )
              ),
          ),
        ),
        title:  Text( '${widget._userTransaction.title}',
            style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Theme.of(context).primaryColor,
              fontFamily: 'PressStart2P',
              fontSize: 12,
              shadows: simpleTextShadow
            )
        
        ),      
       subtitle: Text(
        DateFormat
        .yMMMd()
        .format(widget._userTransaction
        .date),
       ),
       
       trailing: widget._showChart ? null : ElevatedButton.icon(
        onPressed: ()=> widget.delete(widget._userTransaction.id),
        icon: Icon(Icons.delete,
        color: Colors.amber,
        ),
        label: Text('Delete'),
       )
       
      ),
    );
  }
}