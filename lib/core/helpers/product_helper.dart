import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';

part 'product_helper.g.dart';

class ProductHelper {
  List<ProductModel> updateProductQuantity({
    required List<ProductModel> products,
    required ProductModel cartProduct,
    required int quantity,
  }) {
    if (products.isNotEmpty &&
        products.any((element) => element.id == cartProduct.id)) {
      return products.map((product) {
        if (product.id == cartProduct.id) {
          return product.copyWith(cartQuantity: quantity);
        }
        return product; // Keep other products unchanged
      }).toList();
    } else {
      return [...products, cartProduct.copyWith(cartQuantity: quantity)];
    }
  }
}

@riverpod
ProductHelper productHelper(ref) {
  return ProductHelper();
}
