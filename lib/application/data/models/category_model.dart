import 'dart:math';

class CategoryModel {
  final String title;
  final String icon;
  CategoryModel({
    required this.title,
    required this.icon,
  });

  factory CategoryModel.fromJson(String title) {
    return CategoryModel(
      title: title,
      // Random icon for each category
      icon: categoriesIcons[Random().nextInt(4)],
    );
  }

  @override
  String toString() => 'CategoryModel(title: $title)';
}

/// Dummy category icons as API doesn't offer a category icon (offers only category title)
final List<String> categoriesIcons = [
  "assets/icons/dress.svg",
  "assets/icons/shirt.svg",
  "assets/icons/pants.svg",
  "assets/icons/Tshirt.svg",
];
