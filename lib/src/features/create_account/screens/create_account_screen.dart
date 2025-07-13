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
                // Custom back button
                const CustomBackButton(),
                const SizedBox(height: 16),

                // Title for the page
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
                // Text field for first name
                CustomTextField(
                  hintText: 'Firstname',
                  controller: firstNameController,
                ),
                const SizedBox(height: 16),
                // Text field for last name
                CustomTextField(
                  hintText: 'Lastname',
                  controller: lastNameController,
                ),
                const SizedBox(height: 16),
                // Text field for email address
                CustomTextField(
                  hintText: 'Email Address',
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                // Text field for password
                CustomTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                // Continue button
                CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    //TODO: Navigate to onBoarding
                  },
                ),
                const SizedBox(height: 16),
                // Forgot Password text with a GestureDetector for navigation
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate to reset password page
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Forgot Password? ',
                      style: TextStyle(
                        color:
                            isDarkMode
                                ? Colors.white
                                : null, // Adjust color for dark mode
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Reset',
                          style: TextStyle(
                            color:
                                isDarkMode
                                    ? Colors.white
                                    : null, // Adjust color for dark mode
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
