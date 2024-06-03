import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel_expenses/base/styles/text_styles.dart';
import 'package:travel_expenses/domain/transaction/transaction_model.dart';
import 'package:travel_expenses/domain/transaction/transaction_repo.dart';
import 'package:travel_expenses/plugins/http.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  List<TransactionModel> transactions = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final res = await TransactionRepo().loadMyTransactions();
    setState(() {
      transactions = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            child: Column(
              children: transactions.map((val) {
                return ListTile(
                  // leading: CircleAvatar(
                  //   backgroundImage: NetworkImage(val.),
                  // ),
                  title: Text(val.title),
                  subtitle: Text(val.note),
                  trailing: Text(
                    "Nu. ${val.amount}",
                    style: TypoStyles().kSectionHeader,
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}


  //  Column(
  //           children: [
  //             // First transaction
  //             Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black26,
  //                     blurRadius: 5.0,
  //                     spreadRadius: 1.0,
  //                     offset: Offset(0, 5),
  //                   ),
  //                 ],
  //               ),
  //               padding: EdgeInsets.all(16),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Icon(Icons.local_florist, color: Colors.red),
  //                   SizedBox(width: 8),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         'Family Dinner',
  //                         style: TextStyle(
  //                           fontSize: 16,
  //                           color: Colors.black,
  //                         ),
  //                       ),
  //                       Text(
  //                         '17th Jan, 2024',
  //                         style: TextStyle(
  //                           fontSize: 14,
  //                           color: Colors.grey,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Spacer(),
  //                   Text(
  //                     'Rs. 7000',
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       color: Colors.red,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //             // Second transaction
  //             Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black26,
  //                     blurRadius: 5.0,
  //                     spreadRadius: 1.0,
  //                     offset: Offset(0, 5),
  //                   ),
  //                 ],
  //               ),
  //               padding: EdgeInsets.all(16),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Icon(Icons.local_florist,
  //                       color: Colors.green), // Flower icon
  //                   SizedBox(width: 8),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         'Salary',
  //                         style: TextStyle(
  //                           fontSize: 16,
  //                           color: Colors.black,
  //                         ),
  //                       ),
  //                       Text(
  //                         '14th Jan, 2024', // Date below the text
  //                         style: TextStyle(
  //                           fontSize: 14,
  //                           color: Colors.grey,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Spacer(), // Spacer to push the price text to the right end
  //                   Text(
  //                     'Rs. 17,000', // Price text in Rs
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       color: Colors.green,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),

  //             SizedBox(height: 20),

  //             // Third transaction
  //             Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black26,
  //                     blurRadius: 5.0,
  //                     spreadRadius: 1.0,
  //                     offset: Offset(0, 5),
  //                   ),
  //                 ],
  //               ),
  //               padding: EdgeInsets.all(16),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Icon(Icons.local_florist, color: Colors.red), // Flower icon
  //                   SizedBox(width: 8),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         'Bike Repair',
  //                         style: TextStyle(
  //                           fontSize: 16,
  //                           color: Colors.black,
  //                         ),
  //                       ),
  //                       Text(
  //                         '12th Jan, 2024',
  //                         style: TextStyle(
  //                           fontSize: 14,
  //                           color: Colors.grey,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Spacer(),
  //                   Text(
  //                     'Rs. 30000',
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       color: Colors.red,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),

  //             SizedBox(height: 20),

  //             // Fourth transaction
  //             Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black26,
  //                     blurRadius: 5.0,
  //                     spreadRadius: 1.0,
  //                     offset: Offset(0, 5),
  //                   ),
  //                 ],
  //               ),
  //               padding: EdgeInsets.all(16),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Icon(Icons.local_florist, color: Colors.red), // Flower icon
  //                   SizedBox(width: 8),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         'Rent',
  //                         style: TextStyle(
  //                           fontSize: 16,
  //                           color: Colors.black,
  //                         ),
  //                       ),
  //                       Text(
  //                         'May 29, 2024', // Date below the text
  //                         style: TextStyle(
  //                           fontSize: 14,
  //                           color: Colors.grey,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Spacer(),
  //                   Text(
  //                     'Rs. 16700',
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       color: Colors.red,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
    