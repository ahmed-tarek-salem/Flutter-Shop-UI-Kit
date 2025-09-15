import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/product/data/data_sources/product_remote_data_source.dart';

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
