import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';

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
      for (var product in state) {
        if (product.id == cartProduct.id) {
          product = product.copyWith(cartQuantity: product.cartQuantity + 1);
        }
      }
    } else {
      state = [...state, cartProduct.copyWith(cartQuantity: 1)];
    }
  }
}
