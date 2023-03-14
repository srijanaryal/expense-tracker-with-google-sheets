import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopCard extends StatelessWidget {
  final String balance;
  final String income;
  final String expense;
  const TopCard(
      {super.key,
      required this.balance,
      required this.income,
      required this.expense});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0),
                ]),
            child: Center(
                child: Column(children: [
              Text(
                'B A L A N C E ',
                style: TextStyle(color: Colors.grey, fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                balance,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                        ),
                        Column(
                          children: [
                            Text(
                              'Income',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              income,
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Expenses',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              expense,
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]))));
  }
}
