import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

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
          Image.asset(
            "assets/images/product_1.png",
            height: 80,
            width: 80,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Casual Shirt",
                ),
                Text(
                  "\$" + "100",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, color: primaryColor),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
            child: Center(
              child: Text(
                "1",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.remove, color: primaryColor),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}