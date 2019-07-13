import 'package:flutter/material.dart';
import 'package:flutter_app/dart_convert/jsonexample_tab_pages.dart';


//MyApp is a class that we are running within runApp
//=> is used only for expressions.  here is what it can be translated into
//wihtout needing to use the => symbol
//  void main() {
//    runApp(MyApp());
//  }
//just keep this in mind when using =>
void main() => runApp(MyApp());

//stateless widget - Stateless only means that all of its properties are
// immutable and that the only way to change them is to create a new instance
// of that widget. It doesn't e.g. lock the widget tree.
// I guess you can look at a stateless widget being rather static
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
//  I think we can look at this as dictionaries from python
  MyHomePage({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    this portion of the code creates tabs within the home page,
//    as you can see it is split up into a list and dart does the rest of the
//    work for you
    return DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('let\'s parse some JSON'),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Basics'),
                Tab(text: 'Conv. Simple'),
                Tab(text: 'Conv. Complex'),
                Tab(text: 'Conv. List'),
                Tab(text: 'Ser. Simple'),
                Tab(text: 'Ser. Complex'),
                Tab(text: 'Ser. List'),
                Tab(text: 'Built Simple'),
                Tab(text: 'Built Complex'),
                Tab(text: 'Built List'),
              ],
            ),
          ),
          body: SafeArea(
            bottom: false,
            child: TabBarView(
                children: [
                  BasicsPage(),
                  ConvertedSimplePage(),
                  ConvertedComplexPage(),
                  ConvertedListPage(),
                  SerializableSimplePage(),
                  SerializableComplexPage(),
                  SerializableListPage(),
                  BuiltSimplePage(),
                  BuiltComplexPage(),
                  BuiltListPage(),
                ],
            ),
          ),
        ),
    );
  }
}