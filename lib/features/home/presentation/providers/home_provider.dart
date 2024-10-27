import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/home/data/repo/home_repo.dart';

part 'home_provider.g.dart';

@riverpod
class NewArrivalProducts extends _$NewArrivalProducts {
  @override
  Future<List<ProductModel>> build() async {
    final homeRepo = ref.read(homeRepoProvider);
    final products = await homeRepo.getProducts();
    //Assume that first 10 products are new arrival because we don't have an api for that
    final newArrivalProducts = products.take(10).toList();
    return newArrivalProducts;
  }

  setProductQuantity(ProductModel cartProduct, int quantity) {
    final newState = updatedState(
        products: state.value!, cartProduct: cartProduct, quantity: quantity);
    state = AsyncData(newState);
  }
}

@riverpod
class PopularProducts extends _$PopularProducts {
  @override
  Future<List<ProductModel>> build() async {
    final homeRepo = ref.read(homeRepoProvider);
    final products = await homeRepo.getProducts();
    //Skip 10 because first 10 products are new arrival
    final popularProducts = products.skip(10).take(10).toList();
    return popularProducts;
  }

  setProductQuantity(ProductModel cartProduct, int quantity) {
    final newState = updatedState(
        products: state.value!, cartProduct: cartProduct, quantity: quantity);
    state = AsyncData(newState);
  }
}

List<ProductModel> updatedState(
    {required List<ProductModel> products,
    required ProductModel cartProduct,
    required int quantity}) {
  if (products.isNotEmpty == true &&
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
