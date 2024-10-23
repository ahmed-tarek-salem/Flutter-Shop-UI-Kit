import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';

class CartActions extends StatelessWidget {
  final int qunatity;
  final VoidCallback? onRemove;
  final VoidCallback? onAdd;
  const CartActions({
    this.qunatity = 0,
    required this.onRemove,
    required this.onAdd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.add, color: primaryColor),
          onPressed: onAdd,
        ),
        SizedBox(
          width: 10,
          child: Center(
            child: Text(
              qunatity.toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.remove, color: primaryColor),
          onPressed: onRemove,
        ),
      ],
    );
  }
}
