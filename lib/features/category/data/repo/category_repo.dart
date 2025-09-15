import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/category/data/data_sources/category_remote_data_srouce.dart';

abstract class CategoryRepo {
  Future<List<ProductModel>> getCategoryProducts(String categoryTitle);
}

class CategoryRepoImpl implements CategoryRepo {
  final CategoryDataSource remoteDataSource;

  CategoryRepoImpl({required this.remoteDataSource});

  @override
  Future<List<ProductModel>> getCategoryProducts(String categoryTitle) async {
    final data = await remoteDataSource.getCategoryProducts(categoryTitle);
    return List<ProductModel>.from(data.map((e) => ProductModel.fromJson(e)));
  }
}
