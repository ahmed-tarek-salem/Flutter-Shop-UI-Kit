import 'package:flutter/material.dart';
import 'package:stylish/application/data/models/product_model.dart';

/// Global cart store (shared state across the app).
///
/// - Keeps track of products and their quantities in the cart.
/// - Notifies listeners when the cart changes.
/// - Should be accessed through ViewModels, not directly in the view.
class CartStore extends ChangeNotifier {
  final Map<int, ProductModel> products = {};

  /// Adds a product or increases its quantity.
  void addToCart(ProductModel product) {
    print(
        "Add to cart {${product.title}} ${products[product.id]?.cartQuantity}");
    int currentQuantity = products[product.id]?.cartQuantity ?? 0;
    products[product.id] = product.copyWith(cartQuantity: currentQuantity + 1);
    notifyListeners();
  }

  /// Decreases quantity or removes the product if it reaches zero.
  void minusFromCart(ProductModel product) {
    int currentQuantity = products[product.id]?.cartQuantity ?? 0;

    if (currentQuantity > 1) {
      products[product.id] =
          product.copyWith(cartQuantity: currentQuantity - 1);
    } else if (currentQuantity == 1) {
      products.remove(product.id);
    }
    notifyListeners();
  }

  /// Returns product quantity in the cart (0 if not found).
  int getProductQuantity(int id) {
    return products[id]?.cartQuantity ?? 0;
  }
}
