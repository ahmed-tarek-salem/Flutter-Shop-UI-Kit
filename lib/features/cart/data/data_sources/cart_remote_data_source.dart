import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/core/services/network_service.dart';

part 'cart_remote_data_source.g.dart';

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

@riverpod
CartRemoteDataSourceInterface cartRemoteDataSource(ref) {
  final networkService = ref.read(networkServiceProvider);
  return CartRemoteDataSource(networkService: networkService);
}
