import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("First Flutter App"),
      ),
      body: Center(
        child: Text(
          "Hello Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 38, color: Colors.blue),
        ),
      ),
    ),
  ));
}