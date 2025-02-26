import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waste_to_wealth/theme/theme_app.dart';

class PickupHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _pickups = [
    {
      'id': '1',
      'date': DateTime.now().add(Duration(days: 2)),
      'status': 'scheduled',
      'types': ['Plastic', 'Metal'],
      'weight': '5.2',
      'time': '09:00 AM',
    },
    {
      'id': '2',
      'date': DateTime.now().subtract(Duration(days: 1)),
      'status': 'completed',
      'types': ['Paper'],
      'weight': '3.1',
      'time': '02:00 PM',
    },
    // Add more pickup history items...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 40,
        elevation: 0,
        title: Text(
          'Pickup History',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppTheme.textColor),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _pickups.length,
        itemBuilder: (context, index) {
          final pickup = _pickups[index];
          return _buildPickupCard(context, pickup);
        },
      ),
    );
  }

  Widget _buildPickupCard(BuildContext context, Map<String, dynamic> pickup) {
    final isScheduled = pickup['status'] == 'scheduled';
    final date = pickup['date'] as DateTime;
    final formattedDate = DateFormat('MMM d, yyyy').format(date);

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isScheduled 
                ? AppTheme.primaryColor.withOpacity(0.1)
                : Colors.grey[100],
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isScheduled 
                      ? AppTheme.primaryColor
                      : Colors.grey[600],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isScheduled 
                      ? AppTheme.primaryColor
                      : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isScheduled ? 'Scheduled' : 'Completed',
                    style: TextStyle(
                      color: isScheduled ? Colors.white : Colors.grey[700],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, 
                      color: Colors.grey[600], 
                      size: 20
                    ),
                    SizedBox(width: 8),
                    Text(
                      pickup['time'],
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.category_outlined, 
                      color: Colors.grey[600], 
                      size: 20
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Wrap(
                        spacing: 8,
                        children: (pickup['types'] as List<String>)
                          .map((type) => Chip(
                            label: Text(
                              type,
                              style: TextStyle(fontSize: 12),
                            ),
                            backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                            labelStyle: TextStyle(
                              color: AppTheme.primaryColor,
                            ),
                          ))
                          .toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.scale, 
                      color: Colors.grey[600], 
                      size: 20
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${pickup['weight']} kg',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                if (isScheduled) ...[
                  SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      // Show cancellation confirmation dialog
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Cancel Pickup'),
                          content: Text('Are you sure you want to cancel this pickup?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle cancellation
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Cancel Pickup'),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}