import 'package:flutter/material.dart';
import 'package:stylish/application/data/models/category_model.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/application/stores/cart_store.dart';
import 'package:stylish/core/state/async_state.dart';
import 'package:stylish/features/home/data/repo/home_repo.dart';

class HomeViewModel {
  final HomeRepoInterface _homeRepo;
  final CartStore cartStore;

  HomeViewModel({required HomeRepoInterface homeRepo, required this.cartStore})
      : _homeRepo = homeRepo {
    getHomeData();
  }

  final ValueNotifier<AsyncState<List<ProductModel>>> newArrivalProducts =
      ValueNotifier(const Loading());
  final ValueNotifier<AsyncState<List<ProductModel>>> popularProducts =
      ValueNotifier(const Loading());
  final ValueNotifier<AsyncState<List<CategoryModel>>> categories =
      ValueNotifier(const Loading());

  void getHomeData() {
    fetchNewArrivalProducts();
    fetchPopularProducts();
    fetchCategories();
  }

  Future<void> fetchNewArrivalProducts() async {
    try {
      final products = await _homeRepo.getProducts();
      final arrivals = products.take(10).toList();
      newArrivalProducts.value = Success(arrivals);
      print(newArrivalProducts.value.toString());
    } catch (e) {
      newArrivalProducts.value = Error(e.toString());
    }
  }

  Future<void> fetchPopularProducts() async {
    try {
      final products = await _homeRepo.getProducts();
      //Skip 10 because first 10 products are new arrival
      final popular = products.skip(10).take(10).toList();
      popularProducts.value = Success(popular);
    } catch (e) {
      popularProducts.value = Error(e.toString());
    }
  }

  Future<void> fetchCategories() async {
    try {
      final result = await _homeRepo.getCategories();
      categories.value = Success(result);
    } catch (e) {
      categories.value = Error(e.toString());
    }
  }

  void addToCart(ProductModel product) {
    cartStore.addToCart(product);
  }

  void minusFromCart(ProductModel product) {
    cartStore.minusFromCart(product);
  }

  int getProductQuantity(int id) {
    return cartStore.getProductQuantity(id);
  }
}
