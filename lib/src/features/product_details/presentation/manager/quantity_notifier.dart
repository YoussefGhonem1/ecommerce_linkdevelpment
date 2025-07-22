import 'package:flutter_riverpod/flutter_riverpod.dart';

final quantityProvider = StateNotifierProvider<QuantityNotifier, int>((ref) {
  return QuantityNotifier();
});

class QuantityNotifier extends StateNotifier<int> {
  QuantityNotifier() : super(1);
  void increment() => state++;
  void decrement() {
    if (state > 1) state--;
  }
}

// السعر الإجمالي حسب السعر اللي هنبعته:
final totalPriceProvider = Provider.family<double, double>((ref, unitPrice) {
  final quantity = ref.watch(quantityProvider);
  return quantity * unitPrice;
});
