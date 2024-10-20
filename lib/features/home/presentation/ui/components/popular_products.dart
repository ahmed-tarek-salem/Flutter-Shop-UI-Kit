import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/features/home/presentation/providers/home_provider.dart';
import 'package:stylish/models/Product.dart';

import '../../../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
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
        Consumer(builder: (context, ref, child) {
          final products = ref.watch(homeProductsProvider);
          return products.when(
            data: (data) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    products.value!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: ProductCard(
                        title: products.value![index].title,
                        image: products.value![index].images[0],
                        price: products.value![index].price,
                        press: () {},
                      ),
                    ),
                  ),
                ),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
          );
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                demo_product.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: ProductCard(
                    title: demo_product[index].title,
                    image: demo_product[index].image,
                    price: demo_product[index].price,
                    press: () {},
                  ),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
