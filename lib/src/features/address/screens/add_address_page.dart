import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController streetAddressController =
        TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();
    final TextEditingController stateAddressController =
        TextEditingController();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: CustomBackButtonIcon(),
        ),
        leadingWidth: 100,
        title: Text("Add Address", style: theme.textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Street Address',
              controller: streetAddressController,
            ),
            const SizedBox(height: 16),
            CustomTextField(hintText: 'City', controller: cityController),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'State',
                    controller: stateAddressController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Zip code',
                    controller: zipCodeController,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(text: 'Save', onPressed: () {}),
      ),
    );
  }
}
