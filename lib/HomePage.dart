import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop/plus_button.dart';
import 'package:shop/top_card.dart';
import 'package:shop/transaction.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: TopCard(
                balance: '+Rs 50000',
                income: '+1000',
                expense: '-500000',
              ),
            ),
            Expanded(
              child: Transaction(
                transactionName: 'Grocery',
                money: '100',
                expenseOrIncome: 'ense',
              ),
            ),
            PlusButton()
          ],
        ),
      ),
    );
  }
}
