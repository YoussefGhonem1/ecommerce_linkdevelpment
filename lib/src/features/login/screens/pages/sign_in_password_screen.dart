import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';

class SignInPasswordScreen extends StatefulWidget {
  final String email;
  const SignInPasswordScreen({super.key, required this.email});

  @override
  State<SignInPasswordScreen> createState() => _SignInPasswordScreenState();
}

class _SignInPasswordScreenState extends State<SignInPasswordScreen> {
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
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
                controller: _passwordController,
                hintText: 'Password',
                keyboardType: TextInputType.name,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Continue',
                onPressed: () async {
                  try {
                    final userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: widget.email.trim(),
                          password: _passwordController.text.trim(),
                        );
                    final user = userCredential.user;
                    if (user != null ) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.layout,
                        (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login failed: User is null')),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("No user found for that email."),
                        ),
                      );
                    } else if (e.code == 'wrong-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Wrong password provided for that user.",
                          ),
                        ),
                      );
                    }
                  }
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
