// screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool priceChanges = true;
  bool reminders = true;
  bool updates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notifications', style: Theme.of(context).textTheme.headlineSmall),
            SwitchListTile(
              title: Text('Price Changes'),
              value: priceChanges,
              onChanged: (value) => setState(() => priceChanges = value),
              activeColor: Colors.green[700],
            ),
            SwitchListTile(
              title: Text('Pickup Reminders'),
              value: reminders,
              onChanged: (value) => setState(() => reminders = value),
              activeColor: Colors.green[700],
            ),
            SwitchListTile(
              title: Text('Collector Updates'),
              value: updates,
              onChanged: (value) => setState(() => updates = value),
              activeColor: Colors.green[700],
            ),
            SizedBox(height: 16),
            Text('Referral Program', style: Theme.of(context).textTheme.headlineMedium),
            ListTile(
              title: Text('Invite Friends'),
              subtitle: Text('Earn 10 points per referral'),
              trailing: ElevatedButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Referral Link Copied'))),
                child: Text('Share'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}