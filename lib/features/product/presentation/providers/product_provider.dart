import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/product/data/repos/product_repo.dart';

part 'product_provider.g.dart';

@riverpod
Future<ProductModel> product(ref, int id) async {
  final productRepo = ref.read(productRepoProvider);
  final product = await productRepo.getProduct(id);
  return product;
}
