class AppEndpoints {
  ///From https://fakestoreapi.com/docs
  static const String baseUrl = 'https://fakestoreapi.com/';
  static const String products = 'products';
  static const String categories = 'products/categories';
  static String categoryProducts(String categoryTitle) =>
      'products/category/$categoryTitle';
  static String product(int id) => '$products/$id';
  static String cart = 'carts/';
}
