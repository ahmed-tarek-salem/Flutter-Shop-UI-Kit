import 'package:flutter/material.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/application/presentation/components/cart_actions.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/features/home/presentation/ui/components/product_card.dart';

class CartCard extends StatelessWidget {
  final ProductModel product;
  const CartCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: Row(
        children: [
          Image.network(
            product.image,
            height: 80,
            width: 80,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title,
                ),
                Text(
                  "\$" + product.price.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          CartActions(
            onAdd: () => {},
            onRemove: () => {},
            qunatity: product.cartQuantity,
          )
        ],
      ),
    );
  }
}
