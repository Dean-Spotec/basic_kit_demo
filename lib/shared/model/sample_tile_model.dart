// Author: Dean.Liu
// DateTime: 2024/10/09 20:06

library;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'sample_tile_model.g.dart';
abstract class SampleTileModel
    implements Built<SampleTileModel, SampleTileModelBuilder> {
  SampleTileModel._();

  factory SampleTileModel([Function(SampleTileModelBuilder b) updates]) =
  _$SampleTileModel;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'name')
  String get name;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SampleTileModel.serializer, this));
  }

  static SampleTileModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SampleTileModel.serializer, json.decode(jsonString));
  }

  static Serializer<SampleTileModel> get serializer =>
      _$sampleTileModelSerializer;
}
