import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/checkout_notifier.dart';

class AddCardScreen extends ConsumerWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Add Card")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextField(controller: controller, hintText: "Enter Card Details"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120,vertical: 32),
              child: CustomButton(text: "Save Card", onPressed: (){
                ref.read(checkoutProvider.notifier).setCardNumber(controller.text);
                Navigator.pop(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
