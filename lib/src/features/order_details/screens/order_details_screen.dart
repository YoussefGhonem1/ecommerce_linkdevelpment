import 'package:ecommerce_app/src/features/layout/models/orders_model.dart';
import 'package:ecommerce_app/src/features/order_details/widgets/order_items_section.dart';
import 'package:ecommerce_app/src/features/order_details/widgets/order_timeline.dart';
import 'package:ecommerce_app/src/features/order_details/widgets/shipping_details_section.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrdersModel  order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 55,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomBackButtonIcon(),
                      ),
                      Center(
                        child: Text(
                          '${local.order} ${order.id}',
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OrderTimeline(order: order),
                    const SizedBox(height: 24),
                    OrderItemsSection(order: order),
                    const SizedBox(height: 24),
                    ShippingDetailsSection(order: order),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
