import 'package:flutter/material.dart';
import 'package:flutter_sample_app/widgets/chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_sample_app/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get _chartData {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get _totalSumAmount {
    return _chartData.fold(0.0, (amt, item) => amt += item['amount'] as double);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _chartData.map((data) {
            return ChartBar(
              amount: data['amount'] as double,
              label: data['day'] as String,
              pcAmount: _totalSumAmount == 0.0
                  ? 0.0
                  : ((data['amount'] as double) / _totalSumAmount),
            );
          }).toList(),
        ),
      ),
    );
  }
}
