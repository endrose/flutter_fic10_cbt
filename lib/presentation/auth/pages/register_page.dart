import 'package:fic10_cbt/core/components/buttons.dart';
import 'package:fic10_cbt/core/components/custom_text_field.dart';
import 'package:fic10_cbt/core/constants/colors.dart';
import 'package:fic10_cbt/core/extensions/build_context_ext.dart';
import 'package:fic10_cbt/data/datasources/auth_local_datasource.dart';
import 'package:fic10_cbt/data/models/request/register_request_model.dart';
import 'package:fic10_cbt/presentation/auth/pages/login_page.dart';
import 'package:fic10_cbt/presentation/home/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register/register_bloc.dart';

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
        BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            // TODO: implement listener
            state.maybeWhen(
              orElse: () {},
              success: (state) {
                AuthLocalDatasource().saveAuthData(state);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Success Register"),
                  backgroundColor: Colors.green,
                ));
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     //
                //     return const RegisterSuccessDialog();
                //   },
                // );
                //
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    context.pushReplacement(const DashboardPage());
                  },
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Builder(
                  builder: (context) {
                    return Button.filled(
                      onPressed: () {
                        final dataRequest = RegisterRequestModel(
                            name: usernameController.text,
                            email: emailController.text,
                            password: passwordlController.text);

                        context
                            .read<RegisterBloc>()
                            .add(RegisterEvent.register(dataRequest));
                      },
                      label: 'Register',
                    );
                  },
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
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
