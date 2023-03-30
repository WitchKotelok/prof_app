import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class MakeParol extends StatelessWidget {
  const MakeParol({super.key});

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
              children: [
                Consumer<PasswordModel>(
                  builder: (context, model, _) =>
                      _buildPasswordCircle(model.isFilled(0)),
                ),
              ],
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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.amber,
      ),
    );
  }
}

class PasswordModel extends ChangeNotifier {
  List<String> _passwordDigits = [];

  bool isFilled(int index) {
    return _passwordDigits.length > index;
  }

  void addPasswordDigits(String digit, BuildContext context) {
    if (_passwordDigits.length < 4) {
      _passwordDigits.add(digit);
      notifyListeners();
      if (_passwordDigits.length == 4) {
        //! здесь должен быть переход на экран заполнения профиля
      }
    }
  }

  void removePasswordDigit() {
    if (_passwordDigits.isNotEmpty) {
      _passwordDigits.removeLast();
      notifyListeners();
    }
  }
}
