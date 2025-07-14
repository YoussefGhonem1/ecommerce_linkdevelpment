import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';

class SignInPasswordScreen extends StatefulWidget {
  const SignInPasswordScreen({super.key});

  @override
  State<SignInPasswordScreen> createState() => _SignInPasswordScreenState();
}

class _SignInPasswordScreenState extends State<SignInPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 100.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign in', style: theme.textTheme.headlineMedium),
              const SizedBox(height: 40),
              CustomTextField(
                controller: _emailController,
                hintText: 'Password',
                keyboardType: TextInputType.name,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signInEmail);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Forgot Password ? ", style: theme.textTheme.bodyMedium),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.forgetPassword);
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium?.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
