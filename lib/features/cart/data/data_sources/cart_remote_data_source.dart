import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/core/services/network_service.dart';

abstract class CartRemoteDataSourceInterface {
  Future<void> addToCart(ProductModel model);
}

class CartRemoteDataSource implements CartRemoteDataSourceInterface {
  final NetworkService networkService;

  CartRemoteDataSource({required this.networkService});
  @override
  Future<void> addToCart(ProductModel model) async {
    // try {
    //   await networkService.postData(
    //     url: AppEndpoints.cart,
    //     data: model.toJson(),
    //   );
    // } catch (e) {
    //   throw ErrorHandler.handleError(e);
    // }
  }
}
