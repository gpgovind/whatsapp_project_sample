  import 'package:flutter/material.dart';

import 'package:whatsapp_project/splash.dart';

const SAVE_KEY_DATA = 'UserLoggin';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'whatsp',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: NewOne(),
    );
  }
}
