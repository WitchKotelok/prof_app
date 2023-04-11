import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'welcome_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int number = 1;
  Color circle1 = Colors.blue;
  Color circle2 = Colors.white;
  Color circle3 = Colors.white;
  String title = "Анализы";
  String text = "Экспресс сбор и получение проб";
  Image pict = Image.asset("assets/images/illustration1.png");
  EdgeInsets pad = EdgeInsets.only(top: 50, bottom: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialButton(
        onPressed: () {
          number++;
          if (number == 1) {
            circle1 = Colors.blue;
            circle2 = Colors.white;
            circle3 = Colors.white;
            title = "Анализы";
            text = "Экспресс сбор и получение проб";
            pict = Image.asset("assets/images/illustration1.png");
            pad = EdgeInsets.only(top: 50, bottom: 60);
          }
          if (number == 2) {
            circle2 = Colors.blue;
            circle1 = Colors.white;
            circle3 = Colors.white;
            title = "Уведомления";
            text = "Вы быстро узнаете о результатах";
            pict = Image.asset("assets/images/illustration2.png");
            pad = EdgeInsets.only(top: 50, bottom: 55);
          }
          if (number == 3) {
            number = 0;
            circle3 = Colors.blue;
            circle2 = Colors.white;
            circle1 = Colors.white;
            title = "Мониторинг";
            text =
                "Наши врачи всегда наблюдают\nза вашими показателями здоровья";
            pict = Image.asset("assets/images/illustration3.png");
            pad = EdgeInsets.only(top: 50, bottom: 0);
          }
          setState(() {});
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 180,
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            },
                            child: Text("Пропустить"),
                          ),
                        ),
                        Image.asset("assets/images/shape.png")
                      ],
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromARGB(255, 193, 193, 193)),
                            color: circle1,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromARGB(255, 193, 193, 193)),
                            color: circle2,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromARGB(255, 193, 193, 193)),
                            color: circle3,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: pad,
                      child: pict,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
