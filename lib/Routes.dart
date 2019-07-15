
import 'package:flutter/material.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/signuppage.dart';
import 'package:flutter_app/homepage.dart';
//import 'package:flutter_flat_app/theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/SignUp": (BuildContext context) => new SignUpScreen(),
    "/HomePage": (BuildContext context) => new HomeScreen()
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Flutter Flat App",
      home: new LoginScreen(),
//      theme: appTheme,
      routes: routes,
    ));
  }
}