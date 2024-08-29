import 'package:flutter/material.dart';
import 'form_page.dart'; // Import the FormPage
import 'result_page.dart'; // Import the ResultPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Double Activity App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormPage(),
      debugShowCheckedModeBanner: false, // Set FormPage as the initial page
    );
  }
}
