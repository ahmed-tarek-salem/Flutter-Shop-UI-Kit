// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'3756dada476191c81a8f39d049434f501e1bfdf1';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider =
    AutoDisposeFutureProvider<List<CategoryModel>>.internal(
  categories,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoriesRef = AutoDisposeFutureProviderRef<List<CategoryModel>>;
String _$homeRefreshHash() => r'df56560bdede29153bc2321b447a59211a04558f';

/// See also [homeRefresh].
@ProviderFor(homeRefresh)
final homeRefreshProvider = AutoDisposeProvider<void>.internal(
  homeRefresh,
  name: r'homeRefreshProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeRefreshHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HomeRefreshRef = AutoDisposeProviderRef<void>;
String _$newArrivalProductsHash() =>
    r'1af692fbe37778ac71fa31dd6a68ceb339435d23';

/// See also [NewArrivalProducts].
@ProviderFor(NewArrivalProducts)
final newArrivalProductsProvider = AutoDisposeAsyncNotifierProvider<
    NewArrivalProducts, List<ProductModel>>.internal(
  NewArrivalProducts.new,
  name: r'newArrivalProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newArrivalProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewArrivalProducts = AutoDisposeAsyncNotifier<List<ProductModel>>;
String _$popularProductsHash() => r'6a2c935273a0149255a67610012e868b386ea2f9';

/// See also [PopularProducts].
@ProviderFor(PopularProducts)
final popularProductsProvider = AutoDisposeAsyncNotifierProvider<
    PopularProducts, List<ProductModel>>.internal(
  PopularProducts.new,
  name: r'popularProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PopularProducts = AutoDisposeAsyncNotifier<List<ProductModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
