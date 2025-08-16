import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/l10n/translation/app_localizations.dart';
import '../../../shared/components/custom_back_button.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButtonIcon(),
                const SizedBox(height: 16),
                Text(
                  local.createAccount,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),

                CustomTextField(
                  hintText: local.firstName,
                  controller: firstNameController,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  hintText: local.lastName,
                  controller: lastNameController,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  hintText: local.emailAddress,
                  controller: emailController,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  hintText: local.password,
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 32),

                CustomButton(
                  text: local.continueText,
                  onPressed: () async {
                    signUpWithEmail(
                      context: context,
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                    );
                  },
                ),
                const SizedBox(height: 16),

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.forgetPassword);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: '${local.forgotPasswordQ} ',
                      style: TextStyle(color: textColor, fontSize: 14),
                      children: [
                        TextSpan(
                          text: local.reset,
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

Future<void> signUpWithEmail({
  required BuildContext context,
  required String email,
  required String password,
  required String firstName,
  required String lastName,
}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    String uid = userCredential.user!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    }).then((value){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Register Successful ✅")));
      Navigator.pushNamed(context, Routes.signInEmail);
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("The password provided is too weak.")));
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("The account already exists for that email.")));
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Auth error: $e')),
    );
  }
}
