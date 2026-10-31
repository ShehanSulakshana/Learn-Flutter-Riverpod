import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  // Initial value
  @override
  Set<Product> build() {
    return {
      Product(
        id: '4',
        title: 'Red Backpack',
        price: 14,
        image: 'assets/products/backpack.png',
      ),
    };
  }

  // Methods to update state
  
}

final CartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
