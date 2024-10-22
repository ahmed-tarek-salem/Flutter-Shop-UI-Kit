import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/features/product/presentation/providers/product_provider.dart';
import 'package:stylish/models/Product.dart';

import 'components/color_dot.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors[Random().nextInt(4)],
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        final productProv = ref.watch(productProvider(id));
        return productProv.when(
          data: (product) {
            return Column(
              children: [
                Image.network(
                  product.image,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: defaultPadding * 1.5),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(defaultPadding,
                        defaultPadding * 2, defaultPadding, defaultPadding),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(defaultBorderRadius * 3),
                        topRight: Radius.circular(defaultBorderRadius * 3),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const SizedBox(width: defaultPadding),
                            Text(
                              "\$" + product.price.toString(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: defaultPadding),
                          child: Text(
                            product.description,
                          ),
                        ),
                        Text(
                          "Colors",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        Row(
                          children: const [
                            ColorDot(
                              color: Color(0xFFBEE8EA),
                              isActive: false,
                            ),
                            ColorDot(
                              color: Color(0xFF141B4A),
                              isActive: true,
                            ),
                            ColorDot(
                              color: Color(0xFFF4E5C3),
                              isActive: false,
                            ),
                          ],
                        ),
                        const SizedBox(height: defaultPadding * 2),
                        Center(
                          child: SizedBox(
                            width: 200,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: const StadiumBorder()),
                              child: const Text("Add to Cart"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          error: (error, stack) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}
