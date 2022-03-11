import 'package:dima/expenses_app/ui/chart.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class ExpensesHome extends StatefulWidget {
  const ExpensesHome({Key? key}) : super(key: key);

  @override
  State<ExpensesHome> createState() => _ExpensesHomeState();
}

class _ExpensesHomeState extends State<ExpensesHome> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 'item 1',
    //   title: 'wigs',
    //   amount: 35000,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'item 2',
    //   title: 'groceries',
    //   amount: 17000,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions{
    return _userTransactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(Duration(days: 7),),
      );
    }).toList();
  }

  void _addNewTx(String title, double amount, DateTime chosenDate,) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(
              addTx: _addNewTx,
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Personal Expenses'),
          actions: [
            IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Chart(recentTransactions: _recentTransactions ),
              TransactionList(transactions: _userTransactions)
            ],
          ),
        ));
  }
}
