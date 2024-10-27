import 'package:riverpod_annotation/riverpod_annotation.dart';
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
    // Note that no need for try catch blocks here, as riverpod handles it internally
    // when using FutureProviders or AsyncNotifierProviders using "when".
    final response = await networkService.getData(url: AppEndpoints.products);
    return response.data;
  }
}

@riverpod
HomeRemoteDataSource homeRemoteDataSource(ref) {
  final networkService = ref.read(networkServiceProvider);
  return HomeRemoteDataSource(networkService: networkService);
}
