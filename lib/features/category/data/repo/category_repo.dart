import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/category/data/data_sources/category_remote_data_srouce.dart';

part 'category_repo.g.dart';

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

@riverpod
CategoryRepo categoryRepo(CategoryRepoRef ref) {
  final remoteDataSource = ref.watch(categoryRemoteDataSourceProvider);
  return CategoryRepoImpl(remoteDataSource: remoteDataSource);
}
