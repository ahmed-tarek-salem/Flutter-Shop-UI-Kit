import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/features/cart/presentation/ui/components/cart_card.dart';
import 'package:stylish/features/cart/presentation/ui/components/cart_footer.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("My cart"),
      ),
      bottomNavigationBar: CartFooter(),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        padding: const EdgeInsets.all(defaultPadding),
        itemCount: 10,
        itemBuilder: (context, index) {
          return CartCard();
        },
      ),
    );
  }
}
