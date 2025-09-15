import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/core/services/service_locator.dart';
import 'package:stylish/features/cart/presentation/ui/components/cart_card.dart';
import 'package:stylish/features/cart/presentation/ui/components/cart_footer.dart';
import 'package:stylish/features/cart/presentation/view_model/cart_view_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartViewModel = getIt<CartViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("My cart"),
      ),
      bottomNavigationBar: CartFooter(
        cartViewModel: cartViewModel,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        padding: const EdgeInsets.all(defaultPadding),
        itemCount: cartViewModel.cart.length,
        itemBuilder: (context, index) {
          return CartCard(
            product: cartViewModel.cart[index],
            cartViewModel: cartViewModel,
          );
        },
      ),
    );
  }
}
