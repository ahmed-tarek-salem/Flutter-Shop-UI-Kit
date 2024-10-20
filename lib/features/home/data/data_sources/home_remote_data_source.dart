import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/app_error_model.dart';
import 'package:stylish/core/constants/app_endpoints.dart';
import 'package:stylish/core/services/network_service.dart';

part 'home_remote_data_source.g.dart';

abstract class HomeRemoteDataSourceInterface {
  Future<List<dynamic>> getProducts();
}

class HomeRemoteDataSource implements HomeRemoteDataSourceInterface {
  final NetworkService networkService;
  HomeRemoteDataSource({required this.networkService});
  @override
  Future<List<dynamic>> getProducts() async {
    try {
      final response = await networkService.getData(url: AppEndpoints.products);
      return response.data;
    } catch (e) {
      throw ErrorHandler.handleError(e);
    }
  }
}

@riverpod
HomeRemoteDataSource homeRemoteDataSource(ref) {
  final networkService = ref.read(networkServiceProvider);
  return HomeRemoteDataSource(networkService: networkService);
}
