import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "🖐Добро пожоловать!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                      "Войдите, чтобы пользоваться функциями приложения"),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Вход по E-mail",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Container(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text("Далее"),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Или войдите с поомощью",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Войти с Яндекс",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
