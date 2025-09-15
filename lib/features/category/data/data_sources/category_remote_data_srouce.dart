import 'package:stylish/core/constants/app_endpoints.dart';
import 'package:stylish/core/services/network_service.dart';

abstract class CategoryDataSource {
  Future<List<dynamic>> getCategoryProducts(String categoryTitle);
}

class CategoryRemoteDataSource implements CategoryDataSource {
  final NetworkService networkService;
  CategoryRemoteDataSource({required this.networkService});

  @override
  Future<List<dynamic>> getCategoryProducts(String categoryTitle) async {
    final response = await networkService.getData(
        url: AppEndpoints.categoryProducts(categoryTitle));
    return response.data;
  }
}
