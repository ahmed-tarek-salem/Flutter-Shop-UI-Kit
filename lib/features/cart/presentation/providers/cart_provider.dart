import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/core/helpers/product_helper.dart';
import 'package:stylish/features/home/presentation/providers/home_provider.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<ProductModel> build() {
    return [];
  }

  Future<void> addToCart(ProductModel cartProduct) async {
    final productHelper = ref.read(productHelperProvider);
    final newState = productHelper.updateProductQuantity(
        products: state,
        cartProduct: cartProduct,
        quantity: cartProduct.cartQuantity + 1);

    state = newState;
    updateProvidersQuantities(cartProduct, cartProduct.cartQuantity + 1);
  }

  Future<void> minusFromCart(ProductModel cartProduct) async {
    if (cartProduct.cartQuantity > 0) {
      final productHelper = ref.read(productHelperProvider);
      final newState = productHelper.updateProductQuantity(
          products: state,
          cartProduct: cartProduct,
          quantity: cartProduct.cartQuantity - 1);
      state = newState;
    }

    // If quantity is 1 remove the product completely from cart
    if (cartProduct.cartQuantity == 1) {
      state = state.where((element) => element.id != cartProduct.id).toList();
    }

    // If it's 0 then don't do anything
    if (cartProduct.cartQuantity > 0)
      updateProvidersQuantities(cartProduct, cartProduct.cartQuantity - 1);
  }

  /// Update the product qunatity in all the providers the uses this product
  updateProvidersQuantities(ProductModel cartProduct, int quantity) {
    final newArrival = ref.watch(newArrivalProductsProvider.notifier);
    final popular = ref.watch(popularProductsProvider.notifier);
    newArrival.setProductQuantity(cartProduct, quantity);
    popular.setProductQuantity(cartProduct, quantity);
  }

  num getCartTotal() {
    num total = 0;
    for (int i = 0; i < state.length; i++) {
      total += state[i].price * state[i].cartQuantity;
    }
    return num.parse(total.toStringAsFixed(2));
  }

  List<ProductModel> syncWithCart(List<ProductModel> products) {
    final updatedProducts = <ProductModel>[];
    for (var product in products) {
      // Check if the product is already in the cart
      if (state.map((e) => e.id).toList().contains(product.id)) {
        // If it's already in the cart, add it but with the latest quantity from cart
        final cartProduct = state.firstWhere((e) => e.id == product.id);
        updatedProducts
            .add(product.copyWith(cartQuantity: cartProduct.cartQuantity));
      } else {
        // If it's not in the cart, add it to [cartProducts]
        updatedProducts.add(product);
      }
    }
    return updatedProducts;
  }
}
