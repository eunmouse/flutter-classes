import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Constraints Example')),
        body: Center(
          child: Container(
            color: Colors.blue,
            width: 300,
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 100,
              maxWidth: double.infinity,
              maxHeight: 200,
            ),
          ),
        ),
      ),
    );
  }
}
