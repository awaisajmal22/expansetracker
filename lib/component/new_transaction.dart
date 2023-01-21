
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/text.dart';

class NewTransaction extends StatefulWidget {
  
  final Function addNewTx;
   NewTransaction(this.addNewTx, {super.key});
 
  

  @override
  State<NewTransaction> createState() { 
    return _NewTransactionState();
    }
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();  
  DateTime _selectedDate = DateTime.now();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  void datePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2018), 
      lastDate: DateTime.now()
      ).then((pickedDate){
        if(pickedDate == null){
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
        
      }
      );
  }
  void _submitData(){
    if(amountController.text.isEmpty){
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null){
      return;  
    }
     widget.addNewTx(
       enteredTitle,
       enteredAmount,
       _selectedDate
       );
       Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        
        child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  ) ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                       onSubmitted: (_) => _submitData(),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(
                            fontFamily: 'PressStart2P',
                            shadows: simpleTextShadow
                          )
                        ),
                        controller: titleController,
                      ),
                      TextField(
                        onSubmitted: (_) => _submitData(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          labelStyle: TextStyle(
                            shadows: simpleTextShadow,
                            fontFamily: 'PressStart2P'
                          )
                        ),
                        controller: amountController,
                         
                      ),
                      Container(
                        height: 70,
                        child: Row(
                          children: [
                            // ignore: unnecessary_null_comparison
                            Expanded(
                              child: Text(_selectedDate == null ?
                              'No date Choosen'
                              :'Picked Date : ${DateFormat.yMd().format(_selectedDate)}',
                              style: TextStyle(
                                shadows: simpleTextShadow,
                                fontFamily: 'PressStart2P',
                                fontSize: 8,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                            TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            elevation: 0,
                          ),
                          onPressed: datePicker, 
                          child: Text('Choose Date\n\nfrom Here !',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'PressStart2P',
                            fontSize: 10,
                            shadows: simpleTextShadow
                          ),
                          ),
                          )
                            
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0
                        ),
                        onPressed: _submitData, 
                        child: 
                        Text('Add Transaction',
                        style: TextStyle(
                          fontFamily: 'PressStart2P',
                          shadows: simpleTextShadow
                        ),
                        ),
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}