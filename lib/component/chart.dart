
import 'package:expense_tracker/component/chart_bar.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/text.dart';
class Chart extends StatelessWidget {
  late final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);
  

 List<Map<String, Object>> get groupTransaction {
  return  List.generate(7, (index) {
    final weekDay = DateTime.now()
    .subtract(
      Duration(days: index),
    );
    double totalSum = 0.0;
    for(var i = 0; i < recentTransaction.length; i++){
      if(recentTransaction[i].date.day == weekDay.day &&
       recentTransaction[i].date.month == weekDay.month &&
       recentTransaction[i].date.year == weekDay.year){
        totalSum += recentTransaction[i].amount;
       }
    }    
     return {
      'day': DateFormat.E().format(weekDay).substring(0, 1),
      'amount': totalSum
    };
  }).reversed.toList();
 }

 double get maxSpending {
  return groupTransaction.fold(
    0.0,
     (sum , item){
      return sum + (item['amount'] as double);
     });
 }
 
  @override
  Widget build(BuildContext context) { 
    return Card(
      elevation: 6,
      shadowColor: Colors.black38,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupTransaction.map((data) {
                return Flexible(
                  
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: data['day'] as String, 
                    spendingAmount: data['amount'] as double,
                    spendingPctOfTotal: maxSpending == 0.0 ? 0.0 : (data['amount'] as double) / maxSpending
                    ),
                );
              }).toList(),
            ),
            
        // SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}