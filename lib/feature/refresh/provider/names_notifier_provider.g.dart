// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'names_notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$namesNotifierHash() => r'cb1a5b090c8b0c8f949ee0e3995b19f5929dc9ee';

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

abstract class _$NamesNotifier
    extends BuildlessAutoDisposeNotifier<PagingState<SampleTileModel>> {
  late final Type pageType;
  late final int countryId;

  PagingState<SampleTileModel> build({
    required Type pageType,
    required int countryId,
  });
}

/// See also [NamesNotifier].
@ProviderFor(NamesNotifier)
const namesNotifierProvider = NamesNotifierFamily();

/// See also [NamesNotifier].
class NamesNotifierFamily extends Family<PagingState<SampleTileModel>> {
  /// See also [NamesNotifier].
  const NamesNotifierFamily();

  /// See also [NamesNotifier].
  NamesNotifierProvider call({
    required Type pageType,
    required int countryId,
  }) {
    return NamesNotifierProvider(
      pageType: pageType,
      countryId: countryId,
    );
  }

  @override
  NamesNotifierProvider getProviderOverride(
    covariant NamesNotifierProvider provider,
  ) {
    return call(
      pageType: provider.pageType,
      countryId: provider.countryId,
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
  String? get name => r'namesNotifierProvider';
}

/// See also [NamesNotifier].
class NamesNotifierProvider extends AutoDisposeNotifierProviderImpl<
    NamesNotifier, PagingState<SampleTileModel>> {
  /// See also [NamesNotifier].
  NamesNotifierProvider({
    required Type pageType,
    required int countryId,
  }) : this._internal(
          () => NamesNotifier()
            ..pageType = pageType
            ..countryId = countryId,
          from: namesNotifierProvider,
          name: r'namesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$namesNotifierHash,
          dependencies: NamesNotifierFamily._dependencies,
          allTransitiveDependencies:
              NamesNotifierFamily._allTransitiveDependencies,
          pageType: pageType,
          countryId: countryId,
        );

  NamesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageType,
    required this.countryId,
  }) : super.internal();

  final Type pageType;
  final int countryId;

  @override
  PagingState<SampleTileModel> runNotifierBuild(
    covariant NamesNotifier notifier,
  ) {
    return notifier.build(
      pageType: pageType,
      countryId: countryId,
    );
  }

  @override
  Override overrideWith(NamesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: NamesNotifierProvider._internal(
        () => create()
          ..pageType = pageType
          ..countryId = countryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageType: pageType,
        countryId: countryId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<NamesNotifier,
      PagingState<SampleTileModel>> createElement() {
    return _NamesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NamesNotifierProvider &&
        other.pageType == pageType &&
        other.countryId == countryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageType.hashCode);
    hash = _SystemHash.combine(hash, countryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NamesNotifierRef
    on AutoDisposeNotifierProviderRef<PagingState<SampleTileModel>> {
  /// The parameter `pageType` of this provider.
  Type get pageType;

  /// The parameter `countryId` of this provider.
  int get countryId;
}

class _NamesNotifierProviderElement extends AutoDisposeNotifierProviderElement<
    NamesNotifier, PagingState<SampleTileModel>> with NamesNotifierRef {
  _NamesNotifierProviderElement(super.provider);

  @override
  Type get pageType => (origin as NamesNotifierProvider).pageType;
  @override
  int get countryId => (origin as NamesNotifierProvider).countryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
