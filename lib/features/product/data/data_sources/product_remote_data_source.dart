import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/app_error_model.dart';
import 'package:stylish/core/constants/app_endpoints.dart';
import 'package:stylish/core/services/network_service.dart';

part 'product_remote_data_source.g.dart';

abstract class ProductRemoteDataSourceInterface {
  Future<Map<String, dynamic>> getProduct(int id);
}

class ProductRemoteDataSource implements ProductRemoteDataSourceInterface {
  final NetworkService networkService;

  ProductRemoteDataSource({required this.networkService});

  @override
  Future<Map<String, dynamic>> getProduct(int id) async {
    try {
      final response =
          await networkService.getData(url: AppEndpoints.product(id));
      return response.data;
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }
}

@riverpod
ProductRemoteDataSource productRemoteDataSource(ref) {
  final networkService = ref.read(networkServiceProvider);
  return ProductRemoteDataSource(networkService: networkService);
}
