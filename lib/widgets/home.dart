import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/transaction.dart';
import 'package:flutter_sample_app/niyo_app_bar.dart';
import 'package:flutter_sample_app/niyo_theme.dart';
import 'package:flutter_sample_app/widgets/add_transaction.dart';
import 'package:flutter_sample_app/widgets/chart.dart';
import 'package:flutter_sample_app/widgets/transactions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _txns = [
    // Transaction(
    //   amount: 12.2,
    //   date: DateTime.now(),
    //   title: 'Books',
    //   id: 'bks1',
    // ),
    // Transaction(
    //   amount: 23.2,
    //   date: DateTime.now(),
    //   title: 'Books',
    //   id: 'bks1',
    // ),
  ];

  void _addTxn(String title, double amount, DateTime date) {
    var txn = Transaction(
        id: DateTime.now().toString(),
        amount: amount,
        date: date,
        title: title);
    setState(() {
      _txns.add(txn);
    });
  }

  void openAddTransactions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      elevation: 5,
      builder: (bCtx) {
        return AddTransaction(_addTxn);
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return _txns.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _removeTxn(id) {
    setState(() {
      _txns.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NiyoAppBar.bar(context, [
        IconButton(
          onPressed: () => openAddTransactions(context),
          icon: Icon(Icons.add),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => openAddTransactions(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: NiyoTheme.dynamicHeight(context, 460),
                  child: Chart(_recentTransactions),
                ),
                Container(
                  height: NiyoTheme.dynamicHeight(context, 280),
                  width: NiyoTheme.dynamicWidth(context, 360),
                  margin: EdgeInsets.only(
                    top: NiyoTheme.dynamicWidth(context, 10),
                  ),
                  child: Transactions(_txns, _removeTxn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
