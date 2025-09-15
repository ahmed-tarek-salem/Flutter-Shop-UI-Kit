import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/application/stores/cart_store.dart';

/// ViewModel for the cart screen.
///
/// - Exposes cart data from [CartStore].
/// - Delegates mutations (add/remove).
/// - Handles backend sync through [CartRepo] if needed.
class CartViewModel {
  final CartStore cartStore;
  // final CartRepo cartRepo; // add if there's a request in backend for it

  CartViewModel({required this.cartStore});

  List<ProductModel> get cart => cartStore.products.values.toList();

  void addToCart(ProductModel product) {
    // TODO: call CartRepo before/after store update
    cartStore.addToCart(product);
  }

  void minusFromCart(ProductModel product) {
    // TODO: call CartRepo before/after store update
    cartStore.minusFromCart(product);
  }

  int getCartQuantity(int id) {
    return cartStore.getProductQuantity(id);
  }

  /// Returns the total price of the cart
  num get cartTotalPrice => cartStore.products.values
      .fold(0, (prev, product) => prev + product.price * product.cartQuantity);
}
