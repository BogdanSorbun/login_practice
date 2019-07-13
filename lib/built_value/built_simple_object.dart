import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

//you want to avoid part, but it is basically used for code generation scenarios
part 'built_simple_object.g.dart';

abstract class BuiltSimpleObject
    implements Built<BuiltSimpleObject, BuiltSimpleObjectBuilder> {
  static Serializer<BuiltSimpleObject> get serializer =>
      _$builtSimpleObjectSerializer;

  @nullable
  String get aString;

  @nullable
  int get anInt;

  @nullable
  double get aDouble;

  @nullable
  BuiltList<string> get aListOfStrings;

  @nullable
  BuiltList<int> get aListOfInts;

  @nullable
  BuiltList<double> get aListOfDoubles;

  BuiltSimpleObject._();

  factory BuiltSimpleObject([void function(BuiltSimpleObjectBuilder) updates]) =
      _$BuiltSimpleObject;
}