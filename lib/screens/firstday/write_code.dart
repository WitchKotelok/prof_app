import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/write_code_viewmodel.dart';
import 'registrate_screen.dart';

class WriteCode extends StatefulWidget {
  final String email;
  const WriteCode({Key? key, required this.email}) : super(key: key);

  @override
  State<WriteCode> createState() => _WriteCodeState();
}

class _WriteCodeState extends State<WriteCode> {
  int _start = 60;
  Timer? _timer;
  String code = "";
  final _codeControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
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
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 216, 216, 216),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 28,
                  ),
                ),
              ),
            ),
            Container(height: 150),
            const Text(
              "Введите код из E-mail",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(height: 30),
            SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var index in [1, 2, 3, 4])
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextField(
                        controller: _codeControllers[index - 1],
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        onChanged: (value) async {
                          if (value.isNotEmpty) {
                            var currentTextFields =
                                _codeControllers //! уточнить по поводу того
                                    .map((controller) => controller
                                        .text) //!  как именно строка сохраняет
                                    .toList(); //! текущее значение поля для ввода кода

                            if (currentTextFields
                                .every((text) => text.isNotEmpty)) {
                              code = currentTextFields.join();
                            }
                            if (index < _codeControllers.length) {
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).unfocus();

                              await context
                                  .read<WriteCodeViewModel>()
                                  .signIn(widget.email, code);
                              if (context.read<WriteCodeViewModel>().isValid) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MakeParol(),
                                    ));
                              }
                            }
                          }
                        },
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none),
                          ),
                          fillColor: const Color.fromARGB(255, 216, 216, 216),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
            Container(height: 10),
            const Text(
              "Отправить код повторно можно",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "будет через $_start секунд",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
