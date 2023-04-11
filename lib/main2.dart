import 'package:flutter/material.dart';
import 'package:prof_app/main.dart';
import 'package:provider/provider.dart';

import 'screens/main_screen.dart';

void main(List<String> args) {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: MainScreen()),
    );
  }
}
