class AppEndpoints {
  ///From https://fakestoreapi.com/docs
  static const String baseUrl = 'https://fakestoreapi.com/';
  static const String products = 'products';
  static String product(int id) => '$products/$id';
}
