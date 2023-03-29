import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WriteCode extends StatelessWidget {
  const WriteCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.chevron_left,
                    size: 28,
                  ),
                  //
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 216, 216, 216),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
            ),
            Container(
              height: 150,
            ),
            Text(
              "Введите код из E-mail",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 216, 216, 216),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
