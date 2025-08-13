import 'package:ecommerce_app/src/features/layout/models/orders_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersNotifier extends StateNotifier<List<OrdersModel>> {
  OrdersNotifier() : super([]);

  void addOrder(OrdersModel order) {
    state = [...state, order];
  }
}

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, List<OrdersModel>>(
  (ref) => OrdersNotifier(),
);
