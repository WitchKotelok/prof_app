import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WriteCodeViewModel extends ChangeNotifier {
  bool _isValid = false;

  bool get isValid => _isValid;

  void setValid(bool value) {
    _isValid = value;
    notifyListeners();
  }

  Future<void> signIn(String email, String code) async {
    final headers = <String, String>{
      "email": email,
      "code": code,
    }; // сохраняет в себя в качестве библиотеки(?) значеня email и кода
    final response = await http.post(
        Uri.parse('https://medic.madskill.ru/api/signin'),
        headers: headers);

    if (response.statusCode == 200) {
      setValid(true);
    } else {
      setValid(false);
    }
  }
}
