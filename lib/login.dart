import 'package:flutter/material.dart';
import 'package:pro_shered_preference/pro_shered_preference.dart';
import 'package:whatsapp_project/home.dart';
import 'package:whatsapp_project/main.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  late bool _isDataMatched = true;
  final _formkey = GlobalKey<FormState>();
  
  final _username = 'admin';
  final _password = 'pp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'user name',
                    prefixIcon: Icon(Icons.account_box)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter you user name';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'password',
                  prefixIcon: Icon(Icons.security),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter you password';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    checkLogin(context);
                  } else {
                    // print('data empty');
                  }
                },
                icon: Icon(Icons.login),
                label: Text('login'),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void checkLogin(BuildContext ctx) async {
    if (_username == _usernameController.text &&_password == _passwordController.text) {
      final sherePrefs = await SharedPreferences.getInstance();
      await sherePrefs.setBool(SAVE_KEY_DATA, true);

      // ignore: use_build_context_synchronously
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => MyHome()));
    } else {
      // ignore: prefer_const_declarations
      final erorrmesssage = 'user name and password does not match';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(erorrmesssage),
      ));
    }
  }
}
