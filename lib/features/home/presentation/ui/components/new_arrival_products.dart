import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/application/data/models/app_error_model.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/home/presentation/providers/home_provider.dart';
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
            builder: (context, value, child) {
              if (value.isLoading) {
                return const CircularProgressIndicator();
              }
              if (value.error != null) {
                return Text(value.error!);
              }
              final products = value.data ?? [];
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
                      child: ProductCard(product: products[index]),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
