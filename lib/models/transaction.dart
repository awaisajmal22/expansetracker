class Transaction {
  late String id;
  late String title;
  late double amount;
  late DateTime date;
  Transaction(
   { 
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    }
  );
}

final List<Transaction> transactions = [
// Transaction(
//   id: '1', 
//   title: 'New Shoes', 
//   amount: 69.99, 
//   date: DateTime.now()
//   ),
//   Transaction(
//   id: '1', 
//   title: 'Weekly Groceries', 
//   amount: 49.99, 
//   date: DateTime.now()
//   )
];

