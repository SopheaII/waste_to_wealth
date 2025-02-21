// screens/eco_impact_screen.dart
import 'package:flutter/material.dart';

class EcoImpactScreen extends StatelessWidget {
  const EcoImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eco Impact')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Your Green Footprint', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green[100],
              child: Icon(Icons.eco, size: 60, color: Colors.green[700]),
            ),
            SizedBox(height: 16),
            Text('CO2 Saved: 10kg', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Trees Equivalent: 0.10', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('Breakdown', style: Theme.of(context).textTheme.headlineSmall),
                    SizedBox(height: 8),
                    Text('Plastic: 8kg CO2'),
                    Text('Metal: 1.5kg CO2'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}