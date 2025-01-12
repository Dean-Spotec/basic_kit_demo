// Author: Dean.Liu
// DateTime: 2024/09/29 14:24

library;

import 'package:built_value/serializer.dart';

import 'sample_tile_model.dart';
import 'user_model.dart';

part 'serializers.g.dart';

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
@SerializersFor([
  UserModel,
  SampleTileModel,
])
final Serializers serializers = _$serializers;