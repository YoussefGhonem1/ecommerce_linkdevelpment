import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/src/features/create_account/widgets/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyMedium?.color;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                const SizedBox(height: 16),
                Text(
                  'Create Account',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),

                CustomTextField(
                  hintText: 'Firstname',
                  controller: firstNameController,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  hintText: 'Lastname',
                  controller: lastNameController,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  hintText: 'Email Address',
                  controller: emailController,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 32),

                CustomButton(text: 'Continue', onPressed: () {}),
                const SizedBox(height: 16),

                // Forgot Password
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.forgetPassword);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Forgot Password? ',
                      style: TextStyle(color: textColor, fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'Reset',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
