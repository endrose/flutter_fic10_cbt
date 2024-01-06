import 'package:fic10_cbt/core/components/buttons.dart';
import 'package:fic10_cbt/core/components/custom_text_field.dart';
import 'package:fic10_cbt/core/constants/colors.dart';
import 'package:fic10_cbt/core/extensions/build_context_ext.dart';
import 'package:fic10_cbt/data/datasources/auth_local_datasource.dart';
import 'package:fic10_cbt/data/models/request/login_request_model.dart';
import 'package:fic10_cbt/presentation/auth/bloc/bloc/login_bloc.dart';
import 'package:fic10_cbt/presentation/home/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              // TODO: implement listener
              state.maybeWhen(
                orElse: () {},
                success: (data) {
                  // save to local storage
                  print({'login storage': data});
                  AuthLocalDatasource().saveAuthData(data);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Login Success',
                        style: TextStyle(color: AppColors.black)),
                    backgroundColor: AppColors.lightGreen,
                  ));
                  context.pushReplacement(const DashboardPage());
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(message,
                        style: const TextStyle(color: AppColors.black)),
                    backgroundColor: AppColors.lightRed,
                  ));
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Button.filled(
                    onPressed: () {
                      final dataRequest = LoginRequestModel(
                          email: emailController.text,
                          password: passwordController.text);
                      context
                          .read<LoginBloc>()
                          .add(LoginEvent.login(dataRequest));
                    },
                    label: 'Log In'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
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
