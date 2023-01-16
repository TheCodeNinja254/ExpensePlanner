import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 'rtyuio789ij',
        title: 'Shoe Purchase',
        amount: 4000,
        date: DateTime.now()),
    Transaction(
        id: 'rtyuio782ij',
        title: 'Gift Purchase',
        amount: 1600,
        date: DateTime.now())
  ];

  // Doing the heavy lifting by initializing a variable that will have a value later.
  late String amountInput;

  // in a stateless widget we can also use a Controller as below.
  // This is final

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('CHART'),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      // onChanged: (value) {
                      //   titleInput = value;
                      // },
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (value) => amountInput = value,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // background
                        foregroundColor: Colors.white, // foreground
                      ),
                      onPressed: () {
                        print(titleController.text);
                        print(amountInput);
                      },
                      child: Text('Add Expense'),
                    )
                  ],
                ),
              ),
            ),
            Column(
                children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 1),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '\$${tx.amount}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.purple),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(tx.date),
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ));
            }).toList())
          ],
        ));
  }
}
