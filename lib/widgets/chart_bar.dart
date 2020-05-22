import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (layoutContext, contraints) {
      return Column(
        children: <Widget>[
          Container(
            height: contraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('₹ ${spendingAmount.toStringAsFixed(2)}'),
            ),
          ),
          SizedBox(height: contraints.maxHeight * 0.05),
          Container(
            height: contraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(220, 220, 210, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercentageOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: contraints.maxHeight * 0.05),
          Container(
              height: contraints.maxHeight * 0.15,
              child: FittedBox(child: Text('$label')))
        ],
      );
    });
  }
}
