// screens/pickup_history_screen.dart
import 'package:flutter/material.dart';

class PickupHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pickups = [
    {'id': 1, 'type': 'Plastic', 'weight': '5kg', 'status': 'Pending', 'eta': '45 mins', 'collector': 'Ali'},
    {'id': 2, 'type': 'Metal', 'weight': '2kg', 'status': 'Collected', 'eta': 'N/A', 'collector': 'Sara'},
  ];

  PickupHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pickup History')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: pickups.length,
        itemBuilder: (context, index) {
          final pickup = pickups[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.recycling, color: Colors.green[700]),
              title: Text('${pickup['type']} - ${pickup['weight']}'),
              subtitle: Text('Status: ${pickup['status']} | ETA: ${pickup['eta']} | ${pickup['collector']}'),
              trailing: pickup['status'] == 'Pending'
                  ? IconButton(
                      icon: Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pickup Cancelled')));
                      },
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}