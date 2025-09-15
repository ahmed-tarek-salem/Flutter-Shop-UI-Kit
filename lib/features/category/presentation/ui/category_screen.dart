import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/core/services/service_locator.dart';
import 'package:stylish/core/state/async_state.dart';
import 'package:stylish/features/category/presentation/view_model/category_view_model.dart';
import 'package:stylish/features/home/presentation/ui/components/product_card.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  const CategoryScreen({super.key, required this.title});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final CategoryViewModel categoryViewModel;

  @override
  void initState() {
    super.initState();
    categoryViewModel = getIt<CategoryViewModel>(param1: widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ValueListenableBuilder(
            valueListenable: categoryViewModel.products,
            builder: (context, state, child) {
              return state.when(
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  success: (products) => GridView.builder(
                        itemCount: products.length,
                        padding: const EdgeInsets.all(defaultPadding),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: defaultPadding,
                            mainAxisExtent: 250),
                        itemBuilder: (context, index) => ListenableBuilder(
                            listenable: categoryViewModel.cartStore,
                            builder: (context, child) {
                              return ProductCard(
                                cartQuantity: categoryViewModel
                                    .getProductQuantity(products[index].id),
                                product: products[index],
                                onAddToCart: (product) {
                                  categoryViewModel.addToCart(product);
                                },
                                onRemoveFromCart: (product) {
                                  categoryViewModel.minusFromCart(product);
                                },
                              );
                            }),
                      ),
                  error: (e) => Text(e.toString()));
            }));
  }
}
