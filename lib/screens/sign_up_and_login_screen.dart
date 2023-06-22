import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearningap/common/app_color.dart';

class SignUpAndLoginScreen extends StatefulWidget {
  const SignUpAndLoginScreen({super.key});

  @override
  State<SignUpAndLoginScreen> createState() => _SignUpAndLoginScreenState();
}

class _SignUpAndLoginScreenState extends State<SignUpAndLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColor.white,
        body: Center(
          child: Text('Could not find route'),
        ));
  }
}
