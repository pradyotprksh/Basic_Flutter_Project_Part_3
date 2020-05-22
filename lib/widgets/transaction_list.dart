import 'package:financeflutterapp/models/transaction.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (_, constraints) {
              return Column(
                children: <Widget>[
                  Text('No transaction added yet!!'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: userTransactions.length,
            itemBuilder: (buildContext, index) =>
                Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                              '₹ ${userTransactions[index].amount
                                  .toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      '${userTransactions[index].title}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        '${DateFormat.yMMMd().format(
                            userTransactions[index].date)}'),
                    trailing: MediaQuery
                        .of(context)
                        .size
                        .width > 460
                        ? FlatButton.icon(
                        onPressed: () => deleteTransaction(index),
                        icon: Icon(
                          Icons.delete_forever,
                          color: Theme
                              .of(context)
                              .errorColor,
                        ),
                        textColor: Theme
                            .of(context)
                            .errorColor,
                        label: Text('Delete'))
                        : IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: Theme
                            .of(context)
                            .errorColor,
                      ),
                      onPressed: () => deleteTransaction(index),
                    ),
                  ),
                ),
          );
  }
}
