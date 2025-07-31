import 'package:ecommerce_app/src/features/checkout/model/checkout_model.dart';
import 'package:ecommerce_app/src/features/login/screens/widgets/custom_social_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';

class SignInEmailScreen extends StatefulWidget {
  const SignInEmailScreen({super.key});

  @override
  State<SignInEmailScreen> createState() => _SignInEmailScreenState();
}

class _SignInEmailScreenState extends State<SignInEmailScreen> {
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
      backgroundColor: theme.scaffoldBackgroundColor,
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
                hintText: 'Email Address',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signInPassword);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Don't have an Account? ",
                    style: theme.textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.createAccount);
                    },
                    child: Text(
                      'Create One',
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium?.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              SocialLoginButton(
                svgAssetPath:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? 'assets/icons/apple_dark.svg'
                        : 'assets/icons/apple_light.svg',
                text: 'Continue With Apple',
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              SocialLoginButton(
                svgAssetPath: 'assets/icons/google.svg',
                text: 'Continue With Google',
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              SocialLoginButton(
                svgAssetPath: 'assets/icons/facebook.svg',
                text: 'Continue With Facebook',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
