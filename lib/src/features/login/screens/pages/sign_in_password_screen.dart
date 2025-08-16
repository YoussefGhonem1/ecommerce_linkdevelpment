import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';

import '../../../../../core/l10n/translation/app_localizations.dart';

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
    final local = AppLocalizations.of(context)!;

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
              Text(local.signIn, style: theme.textTheme.headlineMedium),
              const SizedBox(height: 40),
              CustomTextField(
                controller: _passwordController,
                hintText: local.password,
                keyboardType: TextInputType.name,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: local.continueText,
                onPressed: () async {
                  try {
                    final userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: widget.email.trim(),
                      password: _passwordController.text.trim(),
                    );
                    final user = userCredential.user;
                    if (user != null) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.layout,
                            (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(local.loginFailedUserNull)),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(local.noUserFound)),
                      );
                    } else if (e.code == 'wrong-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(local.wrongPassword)),
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(local.forgotPasswordQ, style: theme.textTheme.bodyMedium),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.forgetPassword);
                    },
                    child: Text(
                      local.reset,
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
