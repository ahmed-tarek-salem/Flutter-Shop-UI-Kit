import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/application/data/models/category_model.dart';
import 'package:stylish/application/data/models/product_model.dart';
import 'package:stylish/features/category/presentation/ui/category_screen.dart';
import 'package:stylish/features/home/presentation/providers/home_provider.dart';
import 'package:stylish/features/home/presentation/view_models/home_view_model.dart';

import '../../../../../constants.dart';

class CategoriesSection extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const CategoriesSection({Key? key, required this.homeViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ValueListenableBuilder<AsyncState<List<CategoryModel>>>(
          valueListenable: homeViewModel.categories,
          builder: (context, value, child) {
            if (value.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (value.error != null) {
              return Text(value.error!);
            }
            final categories = value.data ?? [];
            if (categories.isEmpty) {
              return const Center(child: Text("No categories available"));
            }
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => CategoryCard(
                icon: categories[index].icon,
                title: categories[index].title,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryScreen(title: categories[index].title)));
                },
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(width: defaultPadding),
            );
          }),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
    );
  }
}
