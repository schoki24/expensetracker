import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel_expenses/base/styles/text_styles.dart';
import 'package:travel_expenses/model/summary_model.dart';
import 'package:travel_expenses/api/api_service.dart';
import 'package:travel_expenses/plugins/http.dart';

class HomeSummary extends StatefulWidget {
  const HomeSummary({super.key});

  @override
  _HomeSummaryState createState() => _HomeSummaryState();
}

class _HomeSummaryState extends State<HomeSummary> {
  SummaryData summary = SummaryData();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final res = await GetRequest('summary');
    final temp = jsonDecode(res.body)['data'];

    setState(() {
      summary = SummaryData(
        expenses: temp['expenses'],
        income: temp['income'],
        openingBalance: temp['openingBalance'],
        maxExpense: temp['maxExpense'],
        totalTransactionsThisMonth: temp['totalTransactionsThisMonth'],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Current Balance',
                style: TypoStyles().kPageHeader.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
              Text(
                'Rs.${summary.openingBalance}',
                style: TypoStyles().kPageHeader.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Container(
            width: 450,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      color: Colors.green,
                      size: 35,
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Income',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Rs.${summary.income}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.red,
                      size: 35,
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Expenses',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Rs.${summary.expenses}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
