import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  // Initial value
  @override
  Set<Product> build() {
    return {};
  }

  // Methods to update state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final CartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});

// Dependent Provider
final cartTotal = Provider<int>((ref) {
  final cartProducts = ref.watch(CartNotifierProvider);

  int total = 0;

  for (Product product in cartProducts) {
    total += product.price;
  }
  return total;
});
