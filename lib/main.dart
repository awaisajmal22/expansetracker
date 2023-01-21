

import 'package:expense_tracker/component/chart.dart';
import 'package:expense_tracker/component/new_transaction.dart';
import 'package:expense_tracker/component/totalsum.dart';
import 'package:expense_tracker/component/transaction_list.dart';
import 'package:expense_tracker/models/text.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transaction.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light()
          .textTheme.copyWith(
           titleMedium: const TextStyle(
            fontFamily: 'PressStart2P',
            fontSize: 18,
            fontWeight: FontWeight.bold
           ),
           ),
          ),
      home: MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
 
  
  List<Transaction> get recentTransaction{
    return transactions.where((tx){
      return tx.date.isAfter(DateTime.now()
      .subtract( Duration(
        days: 31 )),
        );
    }).toList();
  }
@override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
@override
void didChangeAppLifeCycleState(AppLifecycleState state){
     print(state);
}
@override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
   
void _addNewTransaction(String txTitle, double txAmount,DateTime chosenDate){
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
        );
        setState(() {
          transactions.add(newTx);  
        });
   }

void _deleteTransaction(String id){
  setState(() {
    transactions.removeWhere((tx) => tx.id == id);
  });
}
void startAddNewTransaction(BuildContext ctx){
  showModalBottomSheet(
    elevation: 6,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20)
      )
    ),
    context: ctx, 
    builder: (_){
      
      return GestureDetector(
        onTap: (){},
        behavior: HitTestBehavior.opaque,
        child: NewTransaction(_addNewTransaction,
        )
        );
    },);
}

bool _showChart = false;

double get totalSum{
     return recentTransaction.fold(
      0.0, (sum, item) {
    return sum + (item.amount);
  });
}
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text('Expense Tracker',style: appBarTextStyle,),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: ()=> startAddNewTransaction(context), 
            icon: Icon(Icons.add)
            )
        ]
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: (MediaQuery.of(context)
                .size.height - appBar
                .preferredSize
                .height - MediaQuery.of(context)
                .padding.top) * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showChart,
                    Container(
                      decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _showChart ? Colors.red.withOpacity(0.2): Colors.amber.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: Offset(4, 2),
                    )
                  ]
                          ),
                      child: Switch(
                      inactiveThumbColor: Colors.amber,
                      value: _showChart,
                      onChanged: (val){
                        setState(() {
                          _showChart = val;
                        });
                      },
                      ),
                    ),
                    
                  ],
                ),
              ),
             if(_showChart) Container(
                height: (MediaQuery.of(context)
                .size.height - appBar
                .preferredSize
                .height - MediaQuery.of(context)
                .padding.top) * 0.25,
                child:  Chart(transactions)
             ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: (MediaQuery.of(context)
                .size.height - appBar
                .preferredSize
                .height - MediaQuery.of(context)
                .padding.top) * 0.20,
                child: TotalSum(totalSum.toString())
                ),
      
      
             Container(
              height: _showChart == false ?(MediaQuery.of(context)
              .size.height - appBar
              .preferredSize
              .height - MediaQuery.of(context).padding.top) * 0.75
              : (MediaQuery.of(context)
              .size.height - appBar
              .preferredSize
              .height - MediaQuery.of(context).padding.top) * 0.5,
              child: TransactionList(transactions, _deleteTransaction,_showChart)),
              ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> startAddNewTransaction(context),
        child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    
  }
}