import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/category/data/repo/category_repo.dart';

part 'category_provider.g.dart';

@riverpod
Future<List<ProductModel>> categoryProducts(
    Ref ref, String categoryTitle) async {
  final categoryRepo = ref.read(categoryRepoProvider);
  final products = await categoryRepo.getCategoryProducts(categoryTitle);
  return products;
}
