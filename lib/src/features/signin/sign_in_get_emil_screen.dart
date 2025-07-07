import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/src/componants/widgets.dart';

class SignInGetEmailScreen extends StatefulWidget {
  const SignInGetEmailScreen({super.key});

  @override
  State<SignInGetEmailScreen> createState() => _SignInGetEmailScreenState();
}

class _SignInGetEmailScreenState extends State<SignInGetEmailScreen> {
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
                hintText: 'Email Address',
                keyboardType: TextInputType.name,
              ),

              const SizedBox(height: 20),

              CustomButton(text: 'Continue', onPressed: () {}),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Don't have an Account? ",
                    style: theme.textTheme.bodyLarge,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Create One',
                      style: TextStyle(
                        color: theme.textTheme.bodyLarge?.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              SocialLoginButton(
                svgAssetPath:
                    Theme.of(context).brightness == Brightness.dark
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

class SocialLoginButton extends StatelessWidget {
  final String svgAssetPath;
  final String text;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.svgAssetPath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isDarkMode ? const Color(0xFF342F3F) : const Color(0xFFF4F4F4),
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(svgAssetPath, height: 26),
          ),
        ],
      ),
    );
  }
}
