// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:whatsapp_project/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_project/login.dart';
import 'package:whatsapp_project/main.dart';

class NewOne extends StatefulWidget {
  const NewOne({super.key});

  @override
  State<NewOne> createState() => _NewOneState();
}

class _NewOneState extends State<NewOne> {
  @override
  void initState() {
    checkUserLoggIn();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('asset/images/.png'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => LogIn(),
      ),
    );
  }

  Future<void> checkUserLoggIn() async {
    final sherePrefs = await SharedPreferences.getInstance();

    final userLoggIn = sherePrefs.getBool(SAVE_KEY_DATA);
    if (userLoggIn == null || userLoggIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MyHome()));
    }
  }
}
