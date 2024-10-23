import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/cart/data/data_sources/cart_remote_data_source.dart';

part 'cart_repo.g.dart';

abstract class CartRepoInterface {
  Future<void> addToCart(ProductModel model);
}

class CartRepo implements CartRepoInterface {
  final CartRemoteDataSourceInterface cartRemoteDataSource;

  CartRepo({required this.cartRemoteDataSource});

  @override
  Future<void> addToCart(ProductModel model) {
    return cartRemoteDataSource.addToCart(model);
  }
}

@riverpod
CartRepo cartRepo(ref) {
  final CartRemoteDataSourceInterface cartRemoteDataSource =
      ref.watch(cartRemoteDataSourceProvider);
  return CartRepo(cartRemoteDataSource: cartRemoteDataSource);
}
