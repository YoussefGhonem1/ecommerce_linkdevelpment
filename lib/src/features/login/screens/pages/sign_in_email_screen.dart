
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce_app/src/features/login/screens/widgets/custom_social_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/l10n/translation/app_localizations.dart';

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
    final local = AppLocalizations.of(context)!; // localization instance

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
              Text(local.signIn, style: theme.textTheme.headlineMedium),
              const SizedBox(height: 40),
              CustomTextField(
                controller: _emailController,
                hintText: local.emailAddress,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: local.continueText,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.signInPassword,
                    arguments: _emailController.text.trim(),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    local.dontHaveAccount,
                    style: theme.textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.createAccount);
                    },
                    child: Text(
                      local.createOne,
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
                text: local.continueWithApple,
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              SocialLoginButton(
                svgAssetPath: 'assets/icons/google.svg',
                text: local.continueWithGoogle,
                onPressed: () async {
                  await signInWithGoogle(context: context);
                },
              ),
              const SizedBox(height: 15),
              SocialLoginButton(
                svgAssetPath: 'assets/icons/facebook.svg',
                text: local.continueWithFacebook,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> signInWithGoogle({required BuildContext context}) async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    User? user = userCredential.user;

    if (user != null) {
      final userDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid);

      final userExists = await userDoc.get();
      if (!userExists.exists) {
        await userDoc.set({
          'email': user.email,
          'name': user.displayName,
          'photoUrl': user.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.layout,
        (route) => false,
      );
    }
  } catch (e) {
    print("Error signing in with Google: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to login, try again later")),
    );
  }
}
