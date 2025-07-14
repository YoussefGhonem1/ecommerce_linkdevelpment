import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/src/features/create_account/widgets/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for the text input fields
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // Determine if the current theme is dark mode
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color:
                        isDarkMode
                            ? Colors.white
                            : null, // Set color to white in dark mode, otherwise use default
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

                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to reset password page
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Forgot Password? ',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : null,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Reset',
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : null,
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
