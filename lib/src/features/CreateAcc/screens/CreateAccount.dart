import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/back_button_icon.dart';
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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustoBackButton(),
              SizedBox(height: 16.h),

              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 28.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32.h),

              CustomTextField(
                hintText: 'Firstname',
                controller: firstNameController,
              ),
              SizedBox(height: 16.h),

              CustomTextField(
                hintText: 'Lastname',
                controller: lastNameController,
              ),
              SizedBox(height: 16.h),

              CustomTextField(
                hintText: 'Email Address',
                controller: emailController,
              ),
              SizedBox(height: 16.h),

              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 32.h),

              CustomButton(
                text: 'Continue',
                onPressed: () {
                  // Navigate To Onboarding
                },
              ),
              SizedBox(height: 16.h),

              GestureDetector(
                onTap: () {
                  // Navigate to reset password page
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Forgot Password? ',
                    style: TextStyle(color: Colors.black54, fontSize: 14.sp),
                    children: [
                      TextSpan(
                        text: 'Reset',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
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
    );
  }
}
