import 'package:flutter/material.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/core/state/async_state.dart';
import 'package:stylish/features/home/presentation/view_models/home_view_model.dart';

import '../../../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class PopularProductsSection extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const PopularProductsSection({
    required this.homeViewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular",
            pressSeeAll: () {},
          ),
        ),
        ValueListenableBuilder<AsyncState<List<ProductModel>>>(
            valueListenable: homeViewModel.popularProducts,
            builder: (context, state, child) {
              return state.when(
                loading: () => const CircularProgressIndicator(),
                success: (products) => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      products.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: defaultPadding),
                        child: ProductCard(
                          product: products[index],
                          cartStore: homeViewModel.cartStore,
                        ),
                      ),
                    ),
                  ),
                ),
                error: (message) => Text(message),
              );
            }),
      ],
    );
  }
}
