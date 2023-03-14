import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop/api/google_sheets_api.dart';
import 'package:shop/plus_button.dart';
import 'package:shop/top_card.dart';
import 'package:shop/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool timeHasStarted = false;
  void startLoading() {
    timeHasStarted = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (GoogleSheetsApi.loading == false) {
        setState(() {
          timer.cancel();
        });
      }
    });
  }

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
              child: Container(
                child: Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount:
                                GoogleSheetsApi.currentTransactions.length,
                            itemBuilder: (context, index) {
                              return Transaction(
                                  transactionName: GoogleSheetsApi
                                      .currentTransactions[index][0],
                                  money: GoogleSheetsApi
                                      .currentTransactions[index][1],
                                  expenseOrIncome: GoogleSheetsApi
                                      .currentTransactions[index][2]);
                            }))
                  ],
                )),
              ),
            ),
            PlusButton()
          ],
        ),
      ),
    );
  }
}
