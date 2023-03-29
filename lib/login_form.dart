import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
              onPressed: (_formKey.currentState?.validate() == true)
                  ? () {
                      sendPostRequest({"email": _emailController.text});
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

Future<void> sendPostRequest(Map<String, String> headers) async {
  final response = await http.post(
    Uri.parse('https://medic.madskill.ru/api/sendCode'),
    headers: headers,
  );
  if (response.statusCode == 200) {
    print('Всё ок! Проверяйте почту!');
  } else {
    print('Ошибка!!!');
  }
}
