import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      "icon": Icons.local_florist,
      "title": "Family Dinner",
      "date": '17th Jan, 2024',
      "amount": 'Rs. 7000'
    },
    {
      "icon": Icons.shopping_cart,
      "title": "Grocery Shopping",
      "date": '20th Jan, 2024',
      "amount": 'Rs. 2500'
    },
    {
      "icon": Icons.fastfood,
      "title": "Lunch with Friends",
      "date": '22nd Jan, 2024',
      "amount": 'Rs. 1500'
    },
    {
      "icon": Icons.airplane_ticket,
      "title": "Flight Ticket",
      "date": '25th Jan, 2024',
      "amount": 'Rs. 10000'
    },
    {
      "icon": Icons.hotel,
      "title": "Hotel Booking",
      "date": '28th Jan, 2024',
      "amount": 'Rs. 3500'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'Transactions',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          ...transactions
              .map(
                (e) => _buildTransactionRow(
                    e["icon"], e["title"], e["date"], e["amount"]),
              )
              .toList()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            backgroundColor: Colors.deepOrange,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(
      IconData icon, String title, String date, String amount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.red),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
