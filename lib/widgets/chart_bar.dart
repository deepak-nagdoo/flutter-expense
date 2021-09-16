import 'package:flutter/material.dart';
import 'package:flutter_sample_app/niyo_theme.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double pcAmount;
  const ChartBar({
    required this.amount,
    required this.label,
    required this.pcAmount,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return Column(
        children: [
          Text(
            amount.toStringAsFixed(1),
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: constrain.maxHeight * .05,
          ),
          Container(
            height: constrain.maxHeight * .5,
            width: NiyoTheme.dynamicWidth(context, 20),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.grey,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: pcAmount,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constrain.maxHeight * .05,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      );
    });
  }
}
