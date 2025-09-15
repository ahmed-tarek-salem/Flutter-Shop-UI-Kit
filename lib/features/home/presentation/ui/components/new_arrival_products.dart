import 'package:flutter/material.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/core/state/async_state.dart';
import 'package:stylish/features/home/presentation/view_models/home_view_model.dart';

import '../../../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalProductsSection extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const NewArrivalProductsSection({Key? key, required this.homeViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "New Arrival",
            pressSeeAll: () {},
          ),
        ),
        ValueListenableBuilder<AsyncState<List<ProductModel>>>(
            valueListenable: homeViewModel.newArrivalProducts,
            builder: (context, state, child) {
              return state.when(
                loading: () => const CircularProgressIndicator(),
                success: (products) {
                  if (products.isEmpty) {
                    return const Center(child: Text("No products available"));
                  }
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        products.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: defaultPadding),
                          child: ListenableBuilder(
                              listenable: homeViewModel.cartStore,
                              builder: (context, child) {
                                return ProductCard(
                                  product: products[index],
                                  cartQuantity: homeViewModel
                                      .getProductQuantity(products[index].id),
                                  onAddToCart: (product) =>
                                      homeViewModel.addToCart(products[index]),
                                  onRemoveFromCart: (product) => homeViewModel
                                      .minusFromCart(products[index]),
                                );
                              }),
                        ),
                      ),
                    ),
                  );
                },
                error: (message) => Text(message),
              );
            }),
      ],
    );
  }
}
