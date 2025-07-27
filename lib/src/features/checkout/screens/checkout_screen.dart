import 'package:ecommerce_app/src/features/checkout/model/checkout_model.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../shared/components/custom_back_button.dart';
import '../widegts/build_price_row.dart';

class CheckoutScreen extends StatefulWidget {
  final CheckoutModel checkoutModel;
  const CheckoutScreen({
    super.key,
    required this.checkoutModel,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedAddress;
  String? selectedCard;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: CustomBackButtonIcon(),
        ),
        leadingWidth: 100,
        title: Text("Checkout", style: theme.textTheme.headlineSmall),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Shipping Address Card
            GestureDetector(
              onTap: () {
                // Navigate to select or enter address
                // For demo: simulate address selection
                setState(() {
                  selectedAddress = "2715 Ash Dr. San Jose, South Dakota";
                });
              },
              child: _buildTile(
                label: 'Shipping Address',
                value: selectedAddress ?? 'Add Shipping Address',
              ),
            ),

            const SizedBox(height: 16),

            /// Payment Method Card
            GestureDetector(
              onTap: () {
                // Navigate to select or enter payment method
                setState(() {
                  selectedCard = "**** 4187";
                });
              },
              child: _buildTile(
                label: 'Payment Method',
                value: selectedCard != null ? '**** ${selectedCard!.substring(selectedCard!.length - 4)}' : 'Add Payment Method',
                showCardIcon: selectedCard != null,
              ),
            ),

            const Spacer(),
            BuildPriceRow(label: "Subtotal",value: widget.checkoutModel.subtotal,),
            BuildPriceRow( label: "Shipping Cost", value: widget.checkoutModel.shippingCost,),
            BuildPriceRow(label: "Tax", value: widget.checkoutModel.tax,),
            const SizedBox(height: 4),
            BuildPriceRow(isBold: true, label: "Total", value: widget.checkoutModel.total,),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                width: 340,
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$208",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Place Order",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget _buildTile({required String label, required String value, bool showCardIcon = false}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFF6F6F6),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (showCardIcon)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(Assets.masterCardIcon,),
          ),
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    ),
  );
}