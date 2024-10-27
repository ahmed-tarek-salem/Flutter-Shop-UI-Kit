import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/home/presentation/providers/home_provider.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<ProductModel> build() {
    return [];
  }

  Future<void> addToCart(ProductModel cartProduct) async {
    if (state.isNotEmpty == true &&
        state.any((element) => element.id == cartProduct.id)) {
      state = state.map((product) {
        if (product.id == cartProduct.id) {
          return product.copyWith(cartQuantity: product.cartQuantity + 1);
        }
        return product; // Keep other products unchanged
      }).toList();
    } else {
      state = [...state, cartProduct.copyWith(cartQuantity: 1)];
    }
    updateProvidersQuantities(cartProduct, cartProduct.cartQuantity + 1);
  }

  Future<void> minusFromCart(ProductModel cartProduct) async {
    if (cartProduct.cartQuantity > 0) {
      final newProduct = state
          .firstWhere((e) => e.id == cartProduct.id)
          .copyWith(cartQuantity: cartProduct.cartQuantity - 1);
      state = state.map((product) {
        if (product.id == cartProduct.id) {
          return newProduct;
        }
        return product;
      }).toList();
      updateProvidersQuantities(cartProduct, cartProduct.cartQuantity - 1);
      if (newProduct.cartQuantity == 0) {
        state = state.where((element) => element.id != cartProduct.id).toList();
      }
    }
  }

  updateProvidersQuantities(ProductModel cartProduct, int quantity) {
    final newArrival = ref.watch(newArrivalProductsProvider.notifier);
    final popular = ref.watch(popularProductsProvider.notifier);
    newArrival.setProductQuantity(cartProduct, quantity);
    popular.setProductQuantity(cartProduct, quantity);
  }
}
