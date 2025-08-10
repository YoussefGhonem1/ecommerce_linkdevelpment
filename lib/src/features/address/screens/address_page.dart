import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/src/features/address/models/delete_address_params.dart';
import 'package:ecommerce_app/src/features/address/provider/address_provider.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressPage extends ConsumerWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final addressListAsync = ref.watch(addressProvider(userId));
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: CustomBackButtonIcon(),
        ),
        leadingWidth: 100,
        title: Text(
          AppLocalizations.of(context)!.address,
          style: theme.textTheme.headlineSmall,
        ),
      ),
      body: addressListAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
        data: (addresses) {
          if (addresses.isEmpty) {
            return Center(child: Text("No addresses added yet."));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final address = addresses[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${address.street}, ${address.city}, ${address.state}, ${address.zipCode}",
                        style: theme.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.editAddressPage,
                          arguments: {'address': address, 'userId': userId},
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.edit,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                      ),
                      onPressed: () async {
                        final params = DeleteAddressParams(
                          userId: userId,
                          addressId: address.id,
                        );
                        await ref.read(deleteAddressProvider(params).future);
                        ref.invalidate(addressProvider(params.userId));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.delete,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, Routes.addAddressPage);
        },
        child: Icon(Icons.add, color: theme.cardColor),
      ),
    );
  }
}
