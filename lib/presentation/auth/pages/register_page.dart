import 'package:fic10_cbt/core/components/buttons.dart';
import 'package:fic10_cbt/core/components/custom_text_field.dart';
import 'package:fic10_cbt/core/constants/colors.dart';
import 'package:fic10_cbt/core/extensions/build_context_ext.dart';
import 'package:fic10_cbt/presentation/auth/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../widgets/register_success_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordlController = TextEditingController();
    final usernameController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
      ),
      body: ListView(padding: const EdgeInsets.all(24.0), children: [
        CustomTextField(
          controller: emailController,
          label: 'Email Address',
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: usernameController,
          label: 'Username',
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: passwordlController,
          label: 'Password',
          obscureText: true,
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: confirmPasswordController,
          label: 'Confirm Password',
          obscureText: true,
        ),
        const SizedBox(
          height: 24.0,
        ),
        Button.filled(
            onPressed: () {
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  context.pushReplacement(const LoginPage());
                },
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  //
                  return const RegisterSuccessDialog();
                },
              );
            },
            label: 'Register'),
        const SizedBox(
          height: 24.0,
        ),
        GestureDetector(
          onTap: () {
            context.pushReplacement(const LoginPage());
          },
          child: const Text.rich(
            TextSpan(
              text: 'Already have an account ?',
              children: [
                TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: AppColors.primary,
                    )),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        )
      ]),
    );
  }
}
