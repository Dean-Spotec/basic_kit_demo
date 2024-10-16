// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_tile_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SampleTileModel> _$sampleTileModelSerializer =
    new _$SampleTileModelSerializer();

class _$SampleTileModelSerializer
    implements StructuredSerializer<SampleTileModel> {
  @override
  final Iterable<Type> types = const [SampleTileModel, _$SampleTileModel];
  @override
  final String wireName = 'SampleTileModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SampleTileModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SampleTileModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SampleTileModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SampleTileModel extends SampleTileModel {
  @override
  final String id;
  @override
  final String name;

  factory _$SampleTileModel([void Function(SampleTileModelBuilder)? updates]) =>
      (new SampleTileModelBuilder()..update(updates))._build();

  _$SampleTileModel._({required this.id, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'SampleTileModel', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'SampleTileModel', 'name');
  }

  @override
  SampleTileModel rebuild(void Function(SampleTileModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SampleTileModelBuilder toBuilder() =>
      new SampleTileModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SampleTileModel && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SampleTileModel')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class SampleTileModelBuilder
    implements Builder<SampleTileModel, SampleTileModelBuilder> {
  _$SampleTileModel? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SampleTileModelBuilder();

  SampleTileModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SampleTileModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SampleTileModel;
  }

  @override
  void update(void Function(SampleTileModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SampleTileModel build() => _build();

  _$SampleTileModel _build() {
    final _$result = _$v ??
        new _$SampleTileModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SampleTileModel', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'SampleTileModel', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
