import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(TripTrackerApp());

class TripTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Tracker'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.black]),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Card
            Card(
              color: Colors.grey[900],
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with Firebase user photo
                ),
                title: Text('Username', style: TextStyle(color: Colors.white)),
                subtitle: Text('Bio: Ride-hailing driver in Nairobi', style: TextStyle(color: Colors.grey)),
              ),
            ),
            SizedBox(height: 16),
            // Summary Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SummaryCard(title: 'Earnings', value: 'KES 12,500'),
                SummaryCard(title: 'Expenses', value: 'KES 3,200'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SummaryCard(title: 'Savings', value: 'KES 5,000'),
                SummaryCard(title: 'Wallet', value: 'KES 2,300'),
              ],
            ),
            SizedBox(height: 16),
            // Recent Trips
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Bolt Trip - May 24, 2025', style: TextStyle(color: Colors.white)),
                    subtitle: Text('KES 355.04, 14.7 km', style: TextStyle(color: Colors.grey)),
                    trailing: Icon(Icons.arrow_forward, color: Colors.red),
                    onTap: () => Navigator.pushNamed(context, '/trips'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Trips'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Expenses'),
          BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Savings'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  SummaryCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 8),
            Text(value, style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
