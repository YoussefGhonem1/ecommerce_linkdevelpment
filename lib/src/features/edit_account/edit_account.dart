import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _emailController.text = user.email ?? "";

      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

      if (doc.exists) {
        final data = doc.data()!;
        _firstNameController.text = data['firstName'] ?? "";
        _lastNameController.text = data['lastName'] ?? "";
      }
    }
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
            'firstName': _firstNameController.text.trim(),
            'lastName': _lastNameController.text.trim(),
          });
    }

    setState(() => _loading = false);
    Navigator.pop(context); // Go back after saving
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButtonIcon(),
        title: const Text("Edit Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  textAlign: TextAlign.left,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextField(
                controller: _emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                readOnly: true,
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'First Name',
                  textAlign: TextAlign.left,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextField(
                controller: _firstNameController,
                hintText: "First Name",
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Last Name',
                  textAlign: TextAlign.start,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextField(
                controller: _lastNameController,
                hintText: "Last Name",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            _loading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(text: "Save Changes", onPressed: _saveChanges),
      ),
    );
  }
}
