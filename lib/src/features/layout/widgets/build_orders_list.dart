import 'package:ecommerce_app/src/features/layout/models/orders_model.dart';
import 'package:ecommerce_app/src/features/layout/widgets/custom_tab_bar_item.dart';
import 'package:ecommerce_app/src/features/layout/widgets/orders_card.dart';
import 'package:ecommerce_app/src/features/order_details/models/order_model.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:flutter/material.dart';

class BuildOrdersList extends StatefulWidget {
  final List<OrdersModel> order;
  const BuildOrdersList({super.key, required this.order});

  @override
  State<BuildOrdersList> createState() => _BuildOrdersListState();
}

class _BuildOrdersListState extends State<BuildOrdersList> {
  int selectedTapIndex = 0;
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return DefaultTabController(
      length: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
              onTap: (value) {
                setState(() {
                  selectedTapIndex = value;
                });
              },
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: List.generate(5, (index) {
                final titles = [
                  local.processing,
                  local.shipped,
                  local.delivered,
                  local.returned,
                  local.canceled,
                ];
                return CustomTabBarItem(
                  title: titles[index],
                  isSelected: selectedTapIndex == index,
                );
              }),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.order.length,
                itemBuilder: (context, index) {
                  return OrdersCard(
                    order: widget.order[index],
                    onTap:
                        () => Navigator.pushNamed(
                          context,
                          Routes.orderDetails,
                          arguments: testOrder,
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
