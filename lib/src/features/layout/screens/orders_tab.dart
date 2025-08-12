import 'package:ecommerce_app/src/features/layout/models/orders_model.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_empty_orders.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_orders_list.dart';
import 'package:ecommerce_app/src/shared/components/loading_screen.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({super.key});

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  final List<OrdersModel> ordersList = [
    OrdersModel(title: "Order #23452", ordersNum: 4),
    OrdersModel(title: "Order #54542", ordersNum: 2),
    OrdersModel(title: "Order #55312", ordersNum: 1),
  ];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate loading delay
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(local.orders, style: theme.textTheme.headlineSmall),
        ),
        body:
            ordersList.isEmpty
                ? BuildEmptyOrders()
                : BuildOrdersList(order: ordersList),
      ),
    );
  }
}
