import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/application/presentation/components/cart_actions.dart';
import 'package:stylish/features/cart/presentation/providers/cart_provider.dart';
import 'package:stylish/features/product/presentation/ui/product_screen.dart';

import '../../../../../constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(id: product.id),
            ));
      },
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
              ),
              child: Image.network(
                product.image,
                height: 132,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: defaultPadding / 4),
                Text(
                  "\$" + product.price.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Consumer(builder: (context, ref, child) {
              final cartNotifier = ref.read(cartProvider.notifier);
              final cartPro = ref.watch(cartProvider);
              return CartActions(
                onRemove: () {},
                onAdd: () {
                  cartNotifier.addToCart(product);
                },
                qunatity: product.cartQuantity,
              );
            })
          ],
        ),
      ),
    );
  }
}
