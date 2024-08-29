import 'package:flutter/material.dart';
import 'result_page.dart'; // Import the ResultPage to navigate to it

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedDay = '1';
  String _selectedMonth = 'January';
  String _selectedYear = '2023';
  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form  Creation Page'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Make the form scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Name TextField
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 20),

                // Email TextField
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Date of Birth:',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                // Day Spinner
                DropdownButtonFormField<String>(
                  value: _selectedDay,
                  decoration: InputDecoration(labelText: 'Day'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDay = newValue!;
                    });
                  },
                  items: List<String>.generate(
                          31, (index) => (index + 1).toString())
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),

                // Month Spinner
                DropdownButtonFormField<String>(
                  value: _selectedMonth,
                  decoration: InputDecoration(labelText: 'Month'),
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

                // Year Spinner
                DropdownButtonFormField<String>(
                  value: _selectedYear,
                  decoration: InputDecoration(labelText: 'Year'),
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

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Navigate to ResultPage with the form data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            name: _name,
                            email: _email,
                            day: _selectedDay,
                            month: _selectedMonth,
                            year: _selectedYear,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
