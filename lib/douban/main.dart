import 'package:first_flutter/douban/pages/main/main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(DouBanApp());

class DouBanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}


