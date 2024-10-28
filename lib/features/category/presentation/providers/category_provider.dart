import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/core/helpers/product_helper.dart';
import 'package:stylish/features/cart/presentation/providers/cart_provider.dart';
import 'package:stylish/features/category/data/repo/category_repo.dart';

part 'category_provider.g.dart';

@riverpod
class CategoryProducts extends _$CategoryProducts {
  @override
  FutureOr<List<ProductModel>> build(String categoryTitle) async {
    final categoryRepo = ref.read(categoryRepoProvider);
    final cartPro = ref.read(cartProvider.notifier);
    final products = await categoryRepo.getCategoryProducts(categoryTitle);
    final syncedProducts = cartPro.syncWithCart(products);
    return syncedProducts;
  }

  setProductQuantity(ProductModel cartProduct, int quantity) {
    final productHelper = ref.read(productHelperProvider);
    final newState = productHelper.updateProductQuantity(
        products: state.value!, cartProduct: cartProduct, quantity: quantity);
    state = AsyncData(newState);
  }
}
