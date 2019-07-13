import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jsonexample/built_value/built_complex_object.dart';
import 'package:jsonexample/built_value/built_simple_object.dart';
import 'package:jsonexample/built_value/built_value_serializers.dart';
import 'package:jsonexample/dart_convert/converted_complex_object.dart';
import 'package:flutter_app/dart_convert/converted_simple_object.dart';
import 'package:jsonexample/json_serializable/serializable_complex_object.dart';
import 'package:jsonexample/dart_convert/serializable_simple_object.dart';
import 'package:jsonexample/json_strings.dart';
import 'package:jsonexample/utils.dart';
import 'package:jsonexample/widgets.dart';

// Remember stateless widgets are not adjustable, they do nothing
class BasicsPage extends StatelessWidget {
  List<TableRow> createMapRows (
        Map<String, dynamic> values, TextStyle normalStyle, TextStyle boldStyle) {
    return values.keys.map((k) {
      return TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 4.0),
            child: Text(k, style: boldStyle),
          ),
          Text(
            values[k] is String ? '"${values[k]}"' : '${values[k]}',
            style: normalStyle,
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final means single-assignment: a final variable or field must have
//    an initializer.  Once assigned a value, a final variable's value
//    cannot be changed.  can be assigned on runtime!
//    final is used if you expect a variable assignement to remain the same
//    during the lifetime
    final localTheme = Theme.of(context).textTheme;
    final boldStyle = localTheme.body1.copyWith(fontWeight: FontWeight.w600);

    final dynamicListOfInts  = json.decode(JsonStrings.listOfInts);
//    this initializes a list of ints from the json string
    final strongListOfInts = List<int>.from(dynamicListOfInts);

    final dynamicListOfStrings = json.decode(JsonStrings.listOfStrings);
    final strongListOfStrings = List<String>.from(dynamicListOfStrings);

    final dynamicListOfDoubles = json.decode(JsonStrings.listOfDoubles);
    final strongListOfDoubles = List<double>.from(dynamicListOfDoubles);

    final dynamicListOfDynamics = json.decode(JsonStrings.listOdDynamics);
    final strongListOfDynamics = List<dynamic>.from(dynamicListOfDynamics);

    final dynamicMapOfDynamics = json.decode(JsonStrings.mapOfDynamics);
    final strongMapOfDynamics = Map<String, dynamic>.from(dynamicMapOfDynamics)

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Table(
          columnWidths:  const {
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(1.0),
          },
          children: [
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 4.0),
                  child: Text('List of ints:', style: boldStyle),
                ),
                Text(
                  prettyPrintList(strongListOfInts),
                  style: localTheme.body1,
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 4.0),
                  child: Text('list of strings:', style: boldStyle),
                ),
                Text(
                  prettyPrintList(strongListOfStrings),
                  style: localTheme.body1,
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 4.0),
                  child: Text('List of doubles:', style: boldStyle),
                ),
                Text(
                  prettyPrintList(strongListOfDoubles),
                  style: localTheme.body1,
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 4.0),
                  child: Text('list of dynamics:', style: boldStyle),
                ),
                Text(
                  prettyPrintList(strongListOfDynamics),
                  style: localTheme.body1,
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                  child: Text('Map of dynamics:', style: boldStyle),
                ),
                Container(),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(1.0),
            },
            children: createMapRows(
                strongMapOfDynamics,
                localTheme.body1,
                boldStyle,
            ),
          ),
        )
      ],
    );
  }
}

class ConvertedSimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<ConvertedSimpleObject> objects = JsonStrings.simpleObjects.map(
        (jsonString) {
          final parsedJson = json.decode(jsonString);
          return ConvertedSimpleObject.fromJson(parsedJson);
        },
    ).toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        const SizedBox(height: 16.0),
        SimpleObjectViewList(objects),
        const SizedBox(height: 16.0),
      ],
    );
  }
}