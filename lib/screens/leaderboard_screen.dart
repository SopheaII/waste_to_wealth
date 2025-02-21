// screens/leaderboard_screen.dart
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> leaderboard = [
    {'name': 'anon1', 'kg': 15},
    {'name': 'anon2', 'kg': 12},
    {'name': 'You', 'kg': 7},
  ];

  LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: leaderboard.length,
        itemBuilder: (context, index) {
          final entry = leaderboard[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: index == 0 ? Colors.yellow : index == 1 ? Colors.blueGrey : Colors.brown,
              child: Text('${index + 1}', style: TextStyle(color: Colors.white)),
            ),
            title: Text(entry['name']),
            trailing: Text('${entry['kg']} kg', style: TextStyle(fontWeight: FontWeight.bold)),
          );
        },
      ),
    );
  }
}