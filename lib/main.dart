import 'package:flutter/material.dart';
import 'package:travel_expenses/plugins/local_notifications.dart';
import 'package:travel_expenses/screens/Landing/Authentication/login_screen.dart';
import 'package:travel_expenses/screens/Landing/Temp_screen.dart';
import 'package:travel_expenses/screens/Landing/home_screen.dart';
import 'package:travel_expenses/screens/Landing/splash_screen.dart';
import 'package:travel_expenses/screens/Transactions.dart';
import 'package:travel_expenses/screens/addtransaction.dart';
import 'package:travel_expenses/screens/myprofile.dart';
import 'package:travel_expenses/screens/profile.dart';
import 'plugins/local_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotification.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

















// void main() {
//   LocalStorage();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
 
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }
