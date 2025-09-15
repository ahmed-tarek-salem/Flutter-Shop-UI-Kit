import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/features/cart/presentation/view_model/cart_view_model.dart';

class CartFooter extends StatelessWidget {
  final CartViewModel cartViewModel;
  const CartFooter({
    required this.cartViewModel,
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
            ListenableBuilder(
                listenable: cartViewModel.cartStore,
                builder: (context, child) {
                  return Text(
                    "\$" + cartViewModel.cartTotalPrice.toStringAsFixed(2),
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
