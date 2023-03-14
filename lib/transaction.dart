import 'package:flutter/material.dart';
import 'package:shop/plus_button.dart';

class Transaction extends StatelessWidget {
  final String transactionName;
  final String money;
  final String expenseOrIncome;
  const Transaction({
    Key? key,
    required this.transactionName,
    required this.money,
    required this.expenseOrIncome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Expanded(
          child: Container(
              child: Center(
        child: Column(
          children: [
            Container(
              color: Colors.grey[100],
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(transactionName),
                    Text(
                      expenseOrIncome == 'expense' ? '-' : '+' '\$' + money,
                      style: TextStyle(
                          color: (expenseOrIncome == 'expense'
                              ? Colors.red
                              : Colors.green)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
