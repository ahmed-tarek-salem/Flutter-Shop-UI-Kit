import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/product/data/data_sources/product_remote_data_source.dart';

part 'product_repo.g.dart';

abstract class ProductRepoInterface {
  Future<ProductModel> getProduct(int id);
}

class ProductRepo implements ProductRepoInterface {
  final ProductRemoteDataSourceInterface remoteDataSource;
  ProductRepo({required this.remoteDataSource});
  @override
  Future<ProductModel> getProduct(int id) async {
    final data = await remoteDataSource.getProduct(id);
    return ProductModel.fromJson(data);
  }
}

@riverpod
ProductRepo productRepo(ref) {
  final remoteDataSource = ref.read(productRemoteDataSourceProvider);
  return ProductRepo(remoteDataSource: remoteDataSource);
}
