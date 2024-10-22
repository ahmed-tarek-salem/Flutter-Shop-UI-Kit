import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/home/data/repo/home_repo.dart';

part 'home_provider.g.dart';

@riverpod
Future<List<ProductModel>> newArrivalProducts(ref) async {
  final homeRepo = ref.read(homeRepoProvider);
  final newArrivalProducts = await homeRepo.getProducts();
  //Assume that first 10 products are new arrival because we don't have an api for that
  return newArrivalProducts.take(10).toList();
}

@riverpod
Future<List<ProductModel>> popularProducts(ref) async {
  final homeRepo = ref.read(homeRepoProvider);
  final popularProducts = await homeRepo.getProducts();
  //Skip 10 because first 10 products are new arrival
  return popularProducts.skip(10).take(10).toList();
}
