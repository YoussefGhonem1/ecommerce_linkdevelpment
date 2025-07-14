import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../shared/routing/app_routes.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _forgetPassController = TextEditingController();

  @override
  void dispose() {
    _forgetPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.black),
          ),
        ),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forget Password",style:theme.textTheme.headlineMedium),
            SizedBox(height: 20),
            CustomTextField(
                controller: _forgetPassController,
                hintText: "Enter Email address"),
            SizedBox(height: 20),
            CustomButton(text: "Continue", onPressed: (){
              Navigator.pushNamed(context, Routes.returnToLogin);
            })
          ],
        ),
      ),
    );
  }
}
