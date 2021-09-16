import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTxn;
  AddTransaction(this.addTxn);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController _titleInput = TextEditingController();

  final TextEditingController _amountInput = TextEditingController();
  var _selectedDate;

  _sumbitTxn(BuildContext context) {
    String title = _titleInput.text;
    double amount = double.parse(_amountInput.text);
    if (title.isEmpty && amount < 0 && _selectedDate == null) {
      return;
    }
    widget.addTxn(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _openDatePicker(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleInput,
              onSubmitted: (_) => _sumbitTxn(context),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _sumbitTxn(context),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : 'Selected date : ${DateFormat.yMd().format(_selectedDate)}',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                TextButton(
                  onPressed: () => _openDatePicker(context),
                  child: Text('Choose Date'),
                  style: TextButton.styleFrom(primary: Colors.purple),
                )
              ],
            ),
            TextButton(
              onPressed: () => _sumbitTxn(context),
              child: Text('Add transaction'),
              style: TextButton.styleFrom(primary: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
