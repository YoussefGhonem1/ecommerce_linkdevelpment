import 'package:ecommerce_app/src/features/layout/controllers/order_controller.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_empty_orders.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_orders_list.dart';
import 'package:ecommerce_app/src/shared/components/loading_screen.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersTab extends ConsumerStatefulWidget {
  const OrdersTab({super.key});

  @override
  ConsumerState<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends ConsumerState<OrdersTab> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    final ordersList = ref.watch(ordersProvider); 

    return Scaffold(
      appBar: AppBar(
        title: Text(local.orders, style: theme.textTheme.headlineSmall),
      ),
      body: ordersList.isEmpty
          ? BuildEmptyOrders()
          : BuildOrdersList(order: ordersList),
    );
  }
}
