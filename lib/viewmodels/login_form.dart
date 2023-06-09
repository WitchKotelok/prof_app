import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prof_app/screens/firstday/write_code.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
  } //отслеживает изменения в поле ввода Email

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  } //

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              RegExp reg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (value == null || value.isEmpty || !reg.hasMatch(value)) {
                return 'Введите корректный email';
              }
              return null;
            },
            onSaved: (value) =>
                context.read<WelcomeScreenViewModel>().setEmail(value!),
            decoration: InputDecoration(
              labelText: 'Вход по E-mail',
              hintText: 'example@example.com',
              // errorText: _isValid ? null : 'Неверный формат email',
              labelStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: (_formKey.currentState?.validate() ==
                      true) //! Спросить для чего нужен параметр
                  ? () {
                      _formKey.currentState! //! ->
                          .save(); //! Спросить что делает эта строка
                      context.read<WelcomeScreenViewModel>().registerUser();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WriteCode(email: _emailController.text),
                        ),
                      );
                    }
                  : null,
              child: const Text(
                'Далее',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeScreenViewModel extends ChangeNotifier {
  late String _email;
  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  Future<bool> registerUser() async {
    final headers = <String, String>{'email': _email}; //email пользователя
    final response = await http.post(
        Uri.parse('https://medic.madskill.ru/api/sendCode'),
        headers: headers); //код отправленный на почту пользователя
    return response.statusCode == 200 ? true : false;
  }
}
