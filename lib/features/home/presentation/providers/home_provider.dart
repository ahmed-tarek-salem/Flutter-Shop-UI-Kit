import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/category_model.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/core/helpers/product_helper.dart';
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
    final productHelper = ref.read(productHelperProvider);
    final newState = productHelper.updateProductQuantity(
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
    final productHelper = ref.read(productHelperProvider);
    final newState = productHelper.updateProductQuantity(
        products: state.value!, cartProduct: cartProduct, quantity: quantity);
    state = AsyncData(newState);
  }
}

@riverpod
Future<List<CategoryModel>> categories(CategoriesRef ref) async {
  final homeRepo = ref.read(homeRepoProvider);
  final categories = await homeRepo.getCategories();
  return categories;
}

@riverpod
void homeRefresh(HomeRefreshRef ref) {
  ref.refresh(popularProductsProvider);
  ref.refresh(newArrivalProductsProvider);
  ref.refresh(categoriesProvider);
}
