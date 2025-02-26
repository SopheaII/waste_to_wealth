// main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/pickup_scheduler_screen.dart';
import 'screens/rewards_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waste-to-Wealth Collector',
      theme: ThemeData(
        primaryColor: Colors.green[700],
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange[400]),
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/scheduler': (context) => PickupSchedulerScreen(),
        '/rewards': (context) => RewardsScreen(),
        '/settings': (context) => Placeholder(),
      },
    );
  }
}