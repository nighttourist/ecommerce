import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String email;
  final String day;
  final String month;
  final String year;

  ResultPage({
    required this.name,
    required this.email,
    required this.day,
    required this.month,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Entry', style: TextStyle()),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Name: $name', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: $email', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Date of Birth: $day $month $year',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
