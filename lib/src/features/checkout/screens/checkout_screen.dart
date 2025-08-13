import 'package:ecommerce_app/src/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce_app/core/service/fcm.dart';
import 'package:ecommerce_app/src/features/checkout/model/checkout_model.dart';
import 'package:ecommerce_app/src/features/layout/controllers/order_controller.dart';
import 'package:ecommerce_app/src/features/layout/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/l10n/translation/app_localizations.dart';
import '../../../shared/components/custom_back_button.dart';
import '../../../shared/routing/app_routes.dart';
import '../../cart/widgets/price_row.dart';
import '../provider/checkout_notifier.dart';

class CheckoutScreen extends ConsumerWidget {
  final CheckoutModel checkoutModel;
  const CheckoutScreen({super.key, required this.checkoutModel});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkoutState = ref.watch(checkoutProvider);
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: CustomBackButtonIcon(),
        ),
        leadingWidth: 100,
        title: Text(local.checkoutTitle, style: theme.textTheme.headlineSmall),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Shipping Address Section
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.addAddressPage),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          local.shippingAddress,
                          style: theme.textTheme.bodySmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          checkoutState.shippingAddress ??
                              local.addShippingAddress,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Payment Method Section
            GestureDetector(
              onTap:
                  () => Navigator.pushNamed(context, Routes.addPaymentScreen),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            local.paymentMethod,
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                checkoutState.cardNumber != null
                                    ? '${local.cardMask} ${checkoutState.cardNumber!.substring(checkoutState.cardNumber!.length - 4)}'
                                    : local.addPaymentMethod,
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(width: 10),
                              Image.asset('assets/icons/mastercard_icon.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            const Spacer(),

            PriceRow(local.subtotal, checkoutModel.subtotal),
            PriceRow(local.shipping, checkoutModel.shippingCost),
            PriceRow(local.tax, checkoutModel.tax),
            PriceRow(local.total, checkoutModel.total),

            const SizedBox(height: 54),
            GestureDetector(
              onTap: () async{
                final cartItems = ref.read(cartProvider);
                final checkoutState = ref.read(checkoutProvider);
                if (cartItems.isNotEmpty &&
                    checkoutState.shippingAddress != null &&
                    checkoutState.cardNumber != null) {
                  final newOrder = OrdersModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    items: cartItems,
                    shippingAddress: checkoutState.shippingAddress!,
                    paymentMethod: checkoutState.cardNumber!,
                    date: DateTime.now(),
                  );

                  ref.read(ordersProvider.notifier).addOrder(newOrder);
                  ref.read(cartProvider.notifier).clearCart();

                  Navigator.pushNamed(context, Routes.orderPlaced);
                }
            
                await FCM.showLocalAndSave(
            title: 'Order Placed',
            body:
                'Your order has been placed successfully! Total: \$${checkoutModel.total.toStringAsFixed(2)}.',
          );
              },

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFF9B5DE5),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                margin: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${checkoutModel.total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      local.placeOrder,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
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
