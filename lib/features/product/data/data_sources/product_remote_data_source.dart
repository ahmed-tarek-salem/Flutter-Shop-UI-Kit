import 'package:stylish/application/data/models/app_error_model.dart';
import 'package:stylish/core/constants/app_endpoints.dart';
import 'package:stylish/core/services/network_service.dart';

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
