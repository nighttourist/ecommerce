import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'single-Activity -application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedDay = '1';
  String _selectedMonth = 'January';
  String _selectedYear = '2024';
  String _selectedDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('single-Activity -application'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select a Date:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedDay,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDay = newValue!;
                });
              },
              items:
                  List<String>.generate(31, (index) => (index + 1).toString())
                      .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedMonth,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMonth = newValue!;
                });
              },
              items: <String>[
                'January',
                'February',
                'March',
                'April',
                'May',
                'June',
                'July',
                'August',
                'September',
                'October',
                'November',
                'December'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedYear,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedYear = newValue!;
                });
              },
              items: List<String>.generate(
                      50, (index) => (2023 - index).toString())
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDate =
                      'Selected Date: $_selectedDay $_selectedMonth $_selectedYear';
                });
              },
              child: Text('Show Selected Date'),
            ),
            SizedBox(height: 20),
            Text(
              _selectedDate,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              'Powered by Rakibul Haque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
