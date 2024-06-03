import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_expenses/base/styles/text_styles.dart';
import 'package:travel_expenses/screens/Landing/splash_screen.dart';
import 'package:travel_expenses/plugins/local_shared_preferences.dart';
import 'package:travel_expenses/widgets/account_home.dart';
import 'package:travel_expenses/widgets/home_summary.dart';
import 'package:travel_expenses/widgets/recent_transactions.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> logoutUser() async {
    await setTokenToBlank();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Image.asset(
          'assets/images/logo.png',
          color: Colors.white,
          fit: BoxFit.contain,
          height: 54,
        ),
        actions: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 16),
          CircleAvatar(
            child: Text('SC'),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.deepOrange,
            height: 100,
            width: double.infinity,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeSummary(),
                  SummaryAccounts(),
                  RecentTransactions(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
