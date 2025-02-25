import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueIncrementer(),
    );
  }
}

class ValueIncrementer extends StatefulWidget {
  @override
  _ValueIncrementerState createState() => _ValueIncrementerState();
}

class _ValueIncrementerState extends State<ValueIncrementer> {
  double age = 0;
  String data = "";

  void _incrementAge() {
    if (age + 10 < 100) {
      setState(() {
        age += 10;
      });
    } else {
      setState(() {
        age = 99;
      });
    }
  }

  void _decrementAge() {
    if (age - 10 > 0) {
      setState(() {
        age -= 10;
      });
    } else {
      setState(() {
        age = 0;
      });
    }
  }

  void _updateAge(double newAge) {
    setState(() {
      age = newAge;
      _updateMessage();
    });
  }

  Color _getProgressColor(double age) {
    if (age < 33) {
      return Colors.green;
    } else if (age > 34 && age < 68) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  void _updateMessage() {
    if (age < 12) {
      data = "You're a child!";
    } else if (age > 12 && age < 19) {
      data = "Teenager Time";
    } else if (age > 20 && age < 30) {
      data = "You're young adult";
    } else if (age > 31 && age < 50) {
      data = "You're an adult now";
    } else if (age > 51) {
      data = "Teenager Time";
    }
  }

  Text _message() {
    return Text(
      data,
      style: TextStyle(backgroundColor: Colors.lightBlue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'I have ${age.toInt()}  years old',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: _incrementAge,
                    child: Text('Add 10'),
                  ),
                  ElevatedButton(
                    onPressed: _decrementAge,
                    child: Text('Reduce 10'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Age: ${age.toInt()}',
              style: TextStyle(fontSize: 24.0),
            ),
            _message(),
            Slider(
              value: age.toDouble(),
              min: 0,
              max: 100,
              label: age.toInt().toString(),
              onChanged: _updateAge,
            ),
            Container(
              height: 20.0,
              width: 200.0,
              color: _getProgressColor(age),
            ),
          ],
        ),
      ),
    );
  }
}
