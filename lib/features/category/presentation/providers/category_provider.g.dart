// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryProductsHash() => r'64393a08a15badbade016d9a419b485aa0d5e537';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [categoryProducts].
@ProviderFor(categoryProducts)
const categoryProductsProvider = CategoryProductsFamily();

/// See also [categoryProducts].
class CategoryProductsFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [categoryProducts].
  const CategoryProductsFamily();

  /// See also [categoryProducts].
  CategoryProductsProvider call(
    String categoryTitle,
  ) {
    return CategoryProductsProvider(
      categoryTitle,
    );
  }

  @override
  CategoryProductsProvider getProviderOverride(
    covariant CategoryProductsProvider provider,
  ) {
    return call(
      provider.categoryTitle,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryProductsProvider';
}

/// See also [categoryProducts].
class CategoryProductsProvider
    extends AutoDisposeFutureProvider<List<ProductModel>> {
  /// See also [categoryProducts].
  CategoryProductsProvider(
    String categoryTitle,
  ) : this._internal(
          (ref) => categoryProducts(
            ref as CategoryProductsRef,
            categoryTitle,
          ),
          from: categoryProductsProvider,
          name: r'categoryProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryProductsHash,
          dependencies: CategoryProductsFamily._dependencies,
          allTransitiveDependencies:
              CategoryProductsFamily._allTransitiveDependencies,
          categoryTitle: categoryTitle,
        );

  CategoryProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryTitle,
  }) : super.internal();

  final String categoryTitle;

  @override
  Override overrideWith(
    FutureOr<List<ProductModel>> Function(CategoryProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryProductsProvider._internal(
        (ref) => create(ref as CategoryProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryTitle: categoryTitle,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductModel>> createElement() {
    return _CategoryProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryProductsProvider &&
        other.categoryTitle == categoryTitle;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryTitle.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryProductsRef on AutoDisposeFutureProviderRef<List<ProductModel>> {
  /// The parameter `categoryTitle` of this provider.
  String get categoryTitle;
}

class _CategoryProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductModel>>
    with CategoryProductsRef {
  _CategoryProductsProviderElement(super.provider);

  @override
  String get categoryTitle =>
      (origin as CategoryProductsProvider).categoryTitle;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
