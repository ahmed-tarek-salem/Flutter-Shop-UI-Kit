import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/features/home/presentation/providers/home_provider.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/screens/details/details_screen.dart';

import '../../../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({
    Key? key,
  }) : super(key: key);

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
        Consumer(builder: (context, ref, child) {
          final productsProvider = ref.watch(homeProductsProvider);
          return productsProvider.when(
            data: (products) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  products.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: ProductCard(
                      title: products[index].title,
                      image: products[index].images[0],
                      price: products[index].price,
                      press: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //           DetailsScreen(product: demo_product[index]),
                        //     ));
                      },
                    ),
                  ),
                ),
              ),
            ),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
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
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(product: demo_product[index]),
                          ));
                    },
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
