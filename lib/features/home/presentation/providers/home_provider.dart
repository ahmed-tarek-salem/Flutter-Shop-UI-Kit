import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/home/data/repo/home_repo.dart';

part 'home_provider.g.dart';

@riverpod
Future<List<Product>> homeProducts(ref) async {
  final homeRepo = ref.read(homeRepoProvider);
  return await homeRepo.getProducts();
}
