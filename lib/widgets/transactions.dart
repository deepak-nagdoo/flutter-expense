import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/transaction.dart';
import 'package:intl/intl.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> txns;
  final Function removeTxn;
  Transactions(this.txns, this.removeTxn);

  @override
  Widget build(BuildContext ctx) {
    return txns.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'No transactions yet!',
                style: Theme.of(ctx).textTheme.headline1,
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/bike.png',
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    child: FittedBox(
                      child: Text(
                        '${txns[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    '${txns[index].title}',
                    style: Theme.of(ctx).textTheme.headline1,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(txns[index].date),
                    style: Theme.of(ctx).textTheme.subtitle1,
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.highlight_remove,
                      color: Theme.of(ctx).errorColor,
                    ),
                    onPressed: () => removeTxn(txns[index].id),
                  ),
                ),
              );
            },
            itemCount: txns.length,
          );
  }
}
