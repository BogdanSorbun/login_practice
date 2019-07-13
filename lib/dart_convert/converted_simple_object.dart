class ConvertedSimpleObject {
  const ConvertedSimpleObject({
    this.aString,
    this.anInt,
    this.aDouble,
    this.aListOfStrings,
    this.aListOfInts,
    this.aListOfDoubles,
  });

  final String aString;
  final int anInt;
  final double aDouble;
  final List<String> aListOfStrings;
  final List<int> aListOfInts;
  final List<double> aListOfDoubles;

/*
  A factory constructor is quite similar to a static method with the differences that it

    can only return an instance of the current class or one of its subclasses
    can be invoked with new but that is now less relevant since new became optional.
    has no initializer list (no : super())

  So a factory constructor can be used

    to create instances of subclasses (for example depending on the passed parameter
    to return a cached instance instead of a new one
    to prepare calculated values to forward them as parameters to a normal constructor
    so that final fields can be initialized with them. This is often used to work
    around limitations of what can be done in an initializer list of a normal
    constructor (like error handling).

 */
  factory ConvertedSimpleObject.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return ConvertedSimpleObject(
      aString: json['aString'] as String,
      anInt: json['anInt'] as int,
      aDouble: json['aDouble'] as Double,
      aListOfStrings: json['aListOfStrings'] != null
        ? List<String>.from(json['aListOfStrings'] as Iterable<dynamic>)
          : null,
      aListOfInts: json['aListOfInts'] != null
        ? List<int>.from(json['aListOfInts'] as Iterable<dynamic>)
          : null,
      aListOfDoubles: json['aListOfDouble'] != null
        ? List<double>.from(json['aListOfDoubles'] as Iterable<dynamic>)
          : null,
    );
  }
}