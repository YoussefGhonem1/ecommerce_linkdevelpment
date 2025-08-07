import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/src/features/address/models/add_address_params.dart';
import 'package:ecommerce_app/src/features/address/models/address_model.dart';
import 'package:ecommerce_app/src/features/address/provider/address_provider.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddAddressPage extends ConsumerWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
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
        title: Text(AppLocalizations.of(context)!.addAddress, style: theme.textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: AppLocalizations.of(context)!.streetAddress,
              controller: streetAddressController,
            ),
            const SizedBox(height: 16),
            CustomTextField(hintText: AppLocalizations.of(context)!.city, controller: cityController),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: AppLocalizations.of(context)!.state,
                    controller: stateAddressController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    hintText: AppLocalizations.of(context)!.zipCode,
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
        child: CustomButton(
          text: AppLocalizations.of(context)!.save,
          onPressed: () async {
            final address = Address(
              id: '',
              street: streetAddressController.text.trim(),
              city: cityController.text.trim(),
              state: stateAddressController.text.trim(),
              zipCode: zipCodeController.text.trim(),
            );
            final params = AddressParams(userId: userId, address: address);
            await ref.read(addAddressProvider(params).future);
            ref.invalidate(addressProvider(params.userId));
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
