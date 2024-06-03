import 'package:flutter/material.dart';
import 'package:travel_expenses/screens/Landing/home_screen.dart';
import 'package:travel_expenses/screens/account/account_screen.dart';
import 'package:travel_expenses/screens/addtransaction.dart';
import 'package:travel_expenses/screens/myprofile.dart';
import 'package:travel_expenses/widgets/recent_transactions.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;

  List<String> titles = ['Home', 'Account'];
  List<Widget> screens = [
    HomeScreen(),
    MyProfile(),
    RecentTransactions(),
    AddTransaction()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor:
            Colors.white, // Optionally, set the color of the selected item
        unselectedItemColor:
            Colors.white70, // Optionally, set the color of the unselected items
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.deepOrange,
              icon: Icon(Icons.card_giftcard),
              label: 'card'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_document), label: 'Document'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
      ),
    );
  }
}
