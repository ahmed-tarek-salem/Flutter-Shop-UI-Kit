// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryProductsHash() => r'1516c1182ce49f1b44979a82de8ff65de66f1a8f';

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

abstract class _$CategoryProducts
    extends BuildlessAutoDisposeAsyncNotifier<List<ProductModel>> {
  late final String categoryTitle;

  FutureOr<List<ProductModel>> build(
    String categoryTitle,
  );
}

/// See also [CategoryProducts].
@ProviderFor(CategoryProducts)
const categoryProductsProvider = CategoryProductsFamily();

/// See also [CategoryProducts].
class CategoryProductsFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [CategoryProducts].
  const CategoryProductsFamily();

  /// See also [CategoryProducts].
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

/// See also [CategoryProducts].
class CategoryProductsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CategoryProducts, List<ProductModel>> {
  /// See also [CategoryProducts].
  CategoryProductsProvider(
    String categoryTitle,
  ) : this._internal(
          () => CategoryProducts()..categoryTitle = categoryTitle,
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
  FutureOr<List<ProductModel>> runNotifierBuild(
    covariant CategoryProducts notifier,
  ) {
    return notifier.build(
      categoryTitle,
    );
  }

  @override
  Override overrideWith(CategoryProducts Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryProductsProvider._internal(
        () => create()..categoryTitle = categoryTitle,
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
  AutoDisposeAsyncNotifierProviderElement<CategoryProducts, List<ProductModel>>
      createElement() {
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

mixin CategoryProductsRef
    on AutoDisposeAsyncNotifierProviderRef<List<ProductModel>> {
  /// The parameter `categoryTitle` of this provider.
  String get categoryTitle;
}

class _CategoryProductsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryProducts,
        List<ProductModel>> with CategoryProductsRef {
  _CategoryProductsProviderElement(super.provider);

  @override
  String get categoryTitle =>
      (origin as CategoryProductsProvider).categoryTitle;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
