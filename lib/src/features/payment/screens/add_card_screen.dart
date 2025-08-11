import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/l10n/translation/app_localizations.dart';
import '../../../shared/components/custom_back_button.dart';
import '../../../shared/components/custom_text_field.dart';
import '../../checkout/provider/checkout_notifier.dart';
import '../provider/card_provider.dart';

class AddCardScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? existingCard;

  const AddCardScreen({super.key, this.existingCard});

  @override
  ConsumerState<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends ConsumerState<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _ccvController = TextEditingController();
  final _expController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingCard != null) {
      _numberController.text = widget.existingCard!['number'] ?? '';
      _ccvController.text = widget.existingCard!['ccv'] ?? '';
      _expController.text = widget.existingCard!['exp'] ?? '';
      _nameController.text = widget.existingCard!['name'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: CustomBackButtonIcon(),
        ),
        leadingWidth: 100,
        title: Text(
          local.addCard,
          style: theme.textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _numberController,
                hintText: local.cardNumber,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _ccvController,
                      hintText: local.ccv,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      controller: _expController,
                      hintText: local.exp,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nameController,
                hintText: local.cardHolderName,
              ),
              const Spacer(),
              CustomButton(
                onPressed: () async {
                  final cardData = {
                    'number': _numberController.text,
                    'ccv': _ccvController.text,
                    'exp': _expController.text,
                    'name': _nameController.text,
                  };
                  await ref
                      .read(cardRepositoryProvider)
                      .addOrUpdateCard(widget.existingCard?['id'], cardData);
                  ref.read(checkoutProvider.notifier).setCardNumber(_numberController.text);
                  Navigator.pop(context);
                },
                text: local.save,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
