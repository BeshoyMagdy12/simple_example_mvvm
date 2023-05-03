import 'package:breaking_bad_mvvm/features/login/presentation/view/widget/login_screen_body.dart';
import 'package:flutter/material.dart';


class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginScreenBody(),
    );
  }
}