import 'package:fic10_cbt/core/components/buttons.dart';
import 'package:fic10_cbt/core/components/custom_text_field.dart';
import 'package:fic10_cbt/core/constants/colors.dart';
import 'package:fic10_cbt/core/extensions/build_context_ext.dart';
import 'package:fic10_cbt/presentation/home/dashboard_page.dart';
import 'package:flutter/material.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Log In'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          CustomTextField(
            controller: emailController,
            label: 'Email Address',
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SizedBox(
            height: 16.0,
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Forgot Password',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 42.0,
          ),
          Button.filled(
              onPressed: () {
                context.pushReplacement(
                  const DashboardPage(),
                );
              },
              label: 'Log In'),
          const SizedBox(
            height: 24.0,
          ),
          GestureDetector(
            onTap: () {
              context.pushReplacement(const RegisterPage());
            },
            child: const Text.rich(
              TextSpan(
                text: 'Don\'t have an account?',
                children: [
                  TextSpan(
                    text: ' Sign Up',
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
