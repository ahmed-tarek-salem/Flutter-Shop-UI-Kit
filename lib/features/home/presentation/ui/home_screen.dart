import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/core/services/service_locator.dart';
import 'package:stylish/features/cart/presentation/providers/cart_provider.dart';
import 'package:stylish/features/cart/presentation/ui/cart_screen.dart';
import 'package:stylish/features/home/presentation/providers/home_provider.dart';
import 'package:stylish/features/home/presentation/view_models/home_view_model.dart';

import 'components/categories.dart';
import 'components/new_arrival_products.dart';
import 'components/popular_products.dart';
import 'components/search_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeViewModel = getIt<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "15/2 New Texas",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        actions: [
          Consumer(builder: (context, ref, child) {
            final cartNotifier = ref.watch(cartProvider);

            return IconButton(
              icon: Badge(
                  label: Text(cartNotifier.length.toString()),
                  child: Icon(Icons.shopping_cart, color: Colors.grey)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
            );
          }),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          homeViewModel.getHomeData();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
              ),
              const Text(
                "best Outfits for you",
                style: TextStyle(fontSize: 18),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: SearchForm(),
              ),
              CategoriesSection(homeViewModel: homeViewModel),
              NewArrivalProductsSection(homeViewModel: homeViewModel),
              PopularProductsSection(homeViewModel: homeViewModel),
            ],
          ),
        ),
      ),
    );
  }
}
