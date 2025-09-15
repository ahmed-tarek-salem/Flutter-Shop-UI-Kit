import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/cart/data/data_sources/cart_remote_data_source.dart';

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
