
import 'package:expense_tracker/models/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'transactionitems.dart';

class TransactionList extends StatelessWidget{

 final List<Transaction> _userTransaction;

  const TransactionList(this._userTransaction, this.delete, this._showChart, {super.key});
final Function delete;
final bool  _showChart;
 
  @override
  Widget build(BuildContext context) {
    return _userTransaction.isEmpty ? Column(
      children: [
        noTranscationText,
        if(_showChart == false) SizedBox(height: 60,),
        rotatedContainer1,
        rotatedContainer2,
        rotatedContainer3,
        rotatedContainer4
        // Container(
        //   height: 200,
        //   // child: Image.asset('assets/image/waiting.png',
        //   fit: BoxFit.cover,
        //   ),
    // )
      ],
    ) : ListView(
      children: _userTransaction.map((tx) => TransactionItems(
        key: ValueKey(tx.id),
        userTransaction: tx,
         showChart: _showChart,
         delete: delete
        )).toList(),
    );
  }
}

