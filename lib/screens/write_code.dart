import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class WriteCode extends StatefulWidget {
  WriteCode({super.key});

  @override
  State<WriteCode> createState() => _WriteCodeState();
}

class _WriteCodeState extends State<WriteCode> {
  int _start = 60;
  Timer? _timer;
  final _codeControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {});
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

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
              height: 30,
            ),
            Container(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var index in [1, 2, 3, 4])
                    Container(
                      width: 50,
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        // controller: _codeControllers[index],
                        onChanged: (value) async {
                          if (index < _codeControllers.length) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                        },
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          fillColor: Color.fromARGB(255, 216, 216, 216),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Text(
              "Отправить код повторно можно",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "будет через $_start секунд",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
