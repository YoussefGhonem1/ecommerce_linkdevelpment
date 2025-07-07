import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/componants/widgets.dart';

class SignInGetPasswordScreen extends StatefulWidget {
  const SignInGetPasswordScreen({super.key});

  @override
  State<SignInGetPasswordScreen> createState() => _SignInGetPasswordScreenState();
}

class _SignInGetPasswordScreenState extends State<SignInGetPasswordScreen> {
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
              Text('Sign in', style: theme.textTheme.displayLarge),
              const SizedBox(height: 40),

              CustomTextField(
                controller: _emailController,
                hintText: 'Password',
                keyboardType: TextInputType.name,
                obscureText: true,
              ),
              const SizedBox(height: 20),

              CustomButton(text: 'Continue', onPressed: () {}),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Forgot Password ? ", style: theme.textTheme.bodyLarge),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: theme.textTheme.bodyLarge?.color,
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
