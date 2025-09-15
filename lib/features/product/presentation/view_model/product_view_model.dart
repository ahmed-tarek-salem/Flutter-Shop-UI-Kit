import 'package:flutter/foundation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/core/state/async_state.dart';
import 'package:stylish/features/product/data/repos/product_repo.dart';

class ProductViewModel {
  final int id;
  final ProductRepoInterface _productRepo;
  ProductViewModel(
      {required this.id, required ProductRepoInterface productRepo})
      : _productRepo = productRepo {
    getProduct();
  }

  final ValueNotifier<AsyncState<ProductModel>> product =
      ValueNotifier(const Loading());

  Future<void> getProduct() async {
    try {
      final value = await _productRepo.getProduct(id);
      product.value = Success(value);
    } catch (e) {
      product.value = Error(e.toString());
    }
  }
}
