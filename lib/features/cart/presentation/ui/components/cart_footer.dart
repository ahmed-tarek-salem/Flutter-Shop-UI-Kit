import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';

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
            Text(
              "\$" + "100",
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
