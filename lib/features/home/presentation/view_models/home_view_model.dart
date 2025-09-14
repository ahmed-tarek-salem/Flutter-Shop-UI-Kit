import 'package:flutter/material.dart';
import 'package:stylish/application/data/models/category_model.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/home/data/repo/home_repo.dart';

class AsyncState<T> {
  final bool isLoading;
  final T? data;
  final String? error;

  const AsyncState({
    this.isLoading = true,
    this.data,
    this.error,
  });

  AsyncState<T> copyWith({
    bool? isLoading,
    T? data,
    String? error,
  }) {
    return AsyncState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
    );
  }

  factory AsyncState.success(T data) {
    return AsyncState(data: data, isLoading: false, error: null);
  }
  factory AsyncState.error(String error) {
    return AsyncState(error: error, isLoading: false, data: null);
  }

  @override
  String toString() {
    return 'AsyncState(isLoading: $isLoading, data: $data, error: $error)';
  }
}

class HomeViewModel {
  final HomeRepoInterface _homeRepo;

  HomeViewModel({required HomeRepoInterface homeRepo}) : _homeRepo = homeRepo {
    getHomeData();
  }

  final ValueNotifier<AsyncState<List<ProductModel>>> newArrivalProducts =
      ValueNotifier(const AsyncState());
  final ValueNotifier<AsyncState<List<ProductModel>>> popularProducts =
      ValueNotifier(const AsyncState());
  final ValueNotifier<AsyncState<List<CategoryModel>>> categories =
      ValueNotifier(const AsyncState());

  void getHomeData() {
    fetchNewArrivalProducts();
    fetchPopularProducts();
    fetchCategories();
  }

  Future<void> fetchNewArrivalProducts() async {
    try {
      final products = await _homeRepo.getProducts();
      final arrivals = products.take(10).toList();
      newArrivalProducts.value = AsyncState.success(arrivals);
      print(newArrivalProducts.value.toString());
    } catch (e) {
      newArrivalProducts.value = AsyncState.error(e.toString());
    }
  }

  Future<void> fetchPopularProducts() async {
    try {
      final products = await _homeRepo.getProducts();
      final popular = products.skip(10).take(10).toList();
      popularProducts.value = AsyncState.success(popular);
    } catch (e) {
      popularProducts.value = AsyncState.error(e.toString());
    }
  }

  Future<void> fetchCategories() async {
    try {
      final result = await _homeRepo.getCategories();
      categories.value = AsyncState.success(result);
    } catch (e) {
      categories.value = AsyncState.error(e.toString());
    }
  }
}
