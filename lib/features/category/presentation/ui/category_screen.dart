import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/features/category/presentation/providers/category_provider.dart';
import 'package:stylish/features/home/presentation/ui/components/product_card.dart';

class CategoryScreen extends ConsumerWidget {
  final String title;
  const CategoryScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProducts = ref.watch(categoryProductsProvider(title));
    final categoryNotifier = ref.read(categoryProductsProvider(title).notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: categoryProducts.when(
        data: (products) => GridView.builder(
          itemCount: products.length,
          padding: const EdgeInsets.all(defaultPadding),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: defaultPadding,
            crossAxisSpacing: defaultPadding,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) => ProductCard(
            product: products[index],
            onAddToCart: (product) {
              categoryNotifier.setProductQuantity(
                  product, product.cartQuantity + 1);
            },
            onRemoveFromCart: (product) {
              categoryNotifier.setProductQuantity(product,
                  product.cartQuantity == 0 ? 0 : product.cartQuantity - 1);
            },
          ),
        ),
        error: (error, stackTrace) =>
            Text(error.toString(), textAlign: TextAlign.center),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
