import 'package:flutter/material.dart';
import 'package:ulearningap/screens/on_boarding_screen.dart';

import 'common/string_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
      routes: const {
      },
    );
  }
}
