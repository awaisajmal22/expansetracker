import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  
  const ChartBar( {super.key, 
  required this.label,
  required this.spendingAmount,
  required this.spendingPctOfTotal,
  }
  );
  
  

  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 5,),
              Container(
                height: 15,
                child: FittedBox(
                  child: Text('\$${spendingAmount.toStringAsFixed(0)}',

                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 8,
                    color: spendingAmount.toDouble() > 0 ? Colors.red : Colors.amber
                  ),
                  )
                  ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 60,
                width: 10,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 206, 187, 187)
                        ),
                        ),
                    FractionallySizedBox(
                      heightFactor: spendingPctOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(label,
              style: const TextStyle(
                fontFamily: 'PessStart2P',
                fontWeight: FontWeight.bold,
                color: Colors.red
                   ),),
              
            ],
          
    );
  }
}