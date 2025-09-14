import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/core/constants/app_endpoints.dart';
import 'package:stylish/core/services/network_service.dart';

part 'home_remote_data_source.g.dart';

abstract class HomeRemoteDataSourceInterface {
  Future<List<dynamic>> getProducts();
  Future<List<dynamic>> getCategories();
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
      rethrow;
    }
  }

  @override
  Future<List<dynamic>> getCategories() async {
    try {
      final response =
          await networkService.getData(url: AppEndpoints.categories);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
HomeRemoteDataSource homeRemoteDataSource(ref) {
  try {
    final networkService = ref.read(networkServiceProvider);
    return HomeRemoteDataSource(networkService: networkService);
  } catch (e) {
    rethrow;
  }
}
