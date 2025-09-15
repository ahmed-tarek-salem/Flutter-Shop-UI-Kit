import 'package:stylish/application/data/models/product_model.dart';

class ProductHelper {
  /// A helper method to update the quantity of a product in any state list
  ///
  /// You provide a list of products, the product you want to update, and the new quantity
  /// and it returns a new list of products with the updated quantity
  ///
  /// If the product is already in the list, it will update the quantity
  /// If the product is not in the list, it will add the product to the list
  ///
  /// You can use this method to update the quantity of a product in any state list.
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
