import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class MakeParol extends StatefulWidget {
  const MakeParol({super.key});

  @override
  State<MakeParol> createState() => _MakeParolState();
}

class _MakeParolState extends State<MakeParol> {
  List<bool> circles = [false, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Пропустить"),
              ),
            ),
            Container(
              height: 30,
            ),
            Text(
              "Создайте пароль",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Container(
              height: 10,
            ),
            Text(
              "Для защиты ваших персональных данных",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPasswordCircle(circles[0]),
                _buildPasswordCircle(circles[1]),
                _buildPasswordCircle(circles[2]),
                _buildPasswordCircle(circles[3]),
                // Consumer<PasswordModel>(
                //   builder: (context, model, _) =>
                //       _buildPasswordCircle(model.isFilled(0)),
                // ),
              ],
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 310,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildKeyboardButton(context, "1"),
                      _buildKeyboardButton(context, "2"),
                      _buildKeyboardButton(context, "3"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildKeyboardButton(context, "4"),
                      _buildKeyboardButton(context, "5"),
                      _buildKeyboardButton(context, "6"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildKeyboardButton(context, "7"),
                      _buildKeyboardButton(context, "8"),
                      _buildKeyboardButton(context, "9"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildKeyboardButton(context, "0"),
                      _buildKeyboardButton(context, "", icon: Icons.backspace),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordCircle(bool isFilled) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFilled ? Colors.blue : Colors.white,
        border: Border.all(color: Colors.black),
      ),
    );
  }

  Widget _buildKeyboardButton(BuildContext context, String text,
      {IconData? icon}) {
    List<String> passwordDigits = [];

    void addPasswordDigits(String digit, BuildContext context) {
      if (passwordDigits.length < 4) {
        passwordDigits.add(digit);
        if (passwordDigits.length == 4) {
          //! здесь должен быть переход на экран заполнения профиля
        } else {
          setState(() {});
        }
      }
    }

    return Container(
      width: 65,
      height: 65,
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: TextButton(
        onPressed: () {
          // if (text.isNotEmpty) {
          //   model.addPasswordDigits(text, context);
          // } else {
          //   model.removePasswordDigit();
          // }
        },
        child: icon != null
            ? Icon(
                icon,
                color: Colors.white,
              )
            : Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
      ),
      // ),
    );
  }
}

// class PasswordModel extends ChangeNotifier {
//   List<String> _passwordDigits = [];

//   bool isFilled(int index) {
//     return _passwordDigits.length > index;
//   }

//   void addPasswordDigits(String digit, BuildContext context) {
//     if (_passwordDigits.length < 4) {
//       _passwordDigits.add(digit);
//       notifyListeners();
//       if (_passwordDigits.length == 4) {
//         //! здесь должен быть переход на экран заполнения профиля
//       }
//     }
//   }

//   void removePasswordDigit() {
//     if (_passwordDigits.isNotEmpty) {
//       _passwordDigits.removeLast();
//       notifyListeners();
//     }
//   }
// }
