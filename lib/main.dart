import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 30, 15, 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "🖐Добро пожоловать!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Войдите, чтобы пользоваться функциями приложения"),
              SizedBox(
                height: 100,
              ),
              Text(
                "Вход по E-mail",
                style: TextStyle(color: Colors.grey),
              ),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 200,
              ),
              Text("Или войдите с поомощью"),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Войти с Яндекс",
                ),
                style: ButtonStyle(maximumSize: Size.fromHeight(100)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
