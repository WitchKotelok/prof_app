import 'package:flutter/material.dart';
import 'package:prof_app/screens/first_screen.dart';
import 'package:provider/provider.dart';

import 'package:prof_app/viewmodels/login_form.dart';
import 'package:prof_app/viewmodels/write_code_viewmodel.dart';

import 'screens/welcome_page.dart';
import 'screens/write_code.dart';
import 'screens/registrate_screen.dart';
import 'screens/first_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WelcomeScreenViewModel()),
        ChangeNotifierProvider(create: (_) => WriteCodeViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: FirstScreen()),
    );
  }
}
