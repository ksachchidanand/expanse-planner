import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      amount: 86.56,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.35,
      date: DateTime.now(),
    ),
  ];

  // String inputTitle;
  // String inputAmount;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'title'),
                    // onChanged: (value) => inputTitle = value,
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'amount'),
                    // onChanged: (value) => inputAmount = value,
                    controller: amountController,
                  ),
                  FlatButton(
                    onPressed: () {
                      // print(inputTitle);
                      // print(inputAmount);
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions
                .map(
                  (tx) => Card(
                    elevation: 5,
                    color: Colors.grey.shade200,
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            '\$${tx.amount}', // + tx.amount.toString(),
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.purple,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          padding: EdgeInsets.all(10.0),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd().format(DateTime.now()),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
