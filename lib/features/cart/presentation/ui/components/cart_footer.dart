import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/features/cart/presentation/providers/cart_provider.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      width: double.infinity,
      height: 120,
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: Text(
                "Total",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Consumer(builder: (context, ref, child) {
              final cartNotifier = ref.watch(cartProvider.notifier);
              return Text(
                "\$" + cartNotifier.getCartTotal().toString(),
                style: Theme.of(context).textTheme.titleLarge,
              );
            }),
          ]),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, foregroundColor: bgColor),
            onPressed: () {},
            child: Text("Checkout"),
          )
        ],
      ),
    );
  }
}
