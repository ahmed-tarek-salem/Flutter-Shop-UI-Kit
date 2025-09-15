import 'package:flutter/material.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/application/stores/cart_store.dart';
import 'package:stylish/core/state/async_state.dart';
import 'package:stylish/features/category/data/repo/category_repo.dart';

class CategoryViewModel {
  final CategoryRepo _categoryRepo;
  final CartStore _cartStore;
  final String categoryTitle;
  CategoryViewModel(
      {required CategoryRepo categoryRepo,
      required CartStore cartStore,
      required this.categoryTitle})
      : _categoryRepo = categoryRepo,
        _cartStore = cartStore {
    getCategoryProducts(categoryTitle);
  }

  final ValueNotifier<AsyncState<List<ProductModel>>> products =
      ValueNotifier(const Loading());

  getCategoryProducts(String categoryTitle) async {
    try {
      final value = await _categoryRepo.getCategoryProducts(categoryTitle);
      products.value = Success(value);
    } catch (e) {
      products.value = Error(e.toString());
    }
  }

  CartStore get cartStore => _cartStore;

  void addToCart(ProductModel product) {
    _cartStore.addToCart(product);
  }

  void minusFromCart(ProductModel product) {
    _cartStore.minusFromCart(product);
  }

  int getProductQuantity(int id) {
    return _cartStore.getProductQuantity(id);
  }
}
