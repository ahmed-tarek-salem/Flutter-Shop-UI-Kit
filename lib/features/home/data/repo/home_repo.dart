import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/home/data/data_sources/home_remote_data_source.dart';

part 'home_repo.g.dart';

abstract class HomeRepoInterface {
  Future<List<ProductModel>> getProducts();
}

class HomeRepo implements HomeRepoInterface {
  final HomeRemoteDataSourceInterface remoteDataSource;

  HomeRepo({required this.remoteDataSource});
  @override
  Future<List<ProductModel>> getProducts() async {
    final data = await remoteDataSource.getProducts();
    return List<ProductModel>.from(data.map((e) => ProductModel.fromJson(e)));
  }
}

@riverpod
HomeRepo homeRepo(Ref ref) {
  final remoteDataSource = ref.read(homeRemoteDataSourceProvider);
  return HomeRepo(remoteDataSource: remoteDataSource);
}
