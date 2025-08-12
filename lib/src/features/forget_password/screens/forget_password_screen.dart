import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/l10n/translation/app_localizations.dart';
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
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(leading: const CustomBackButtonIcon()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(local.forgetPassword, style: theme.textTheme.headlineMedium),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _forgetPassController,
              hintText: local.enterEmailAddress,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: local.continueText,
              onPressed: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(
                  email: _forgetPassController.text.trim(),
                )
                    .then((_) {
                  Navigator.pushNamed(context, Routes.returnToLogin);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
