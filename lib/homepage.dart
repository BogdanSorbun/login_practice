import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    Hero makes for nice transitions between screens (routes?)
    final an_image = Hero(
      tag: 'hero',
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.transparent,
//            you can use any image you want here
            backgroundImage: AssetImage('assets/alucard.jpg'),
          ),
        ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final randome_quote = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'this is just a stupid random sample text',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
//  think of a container as a section within that you can design however you
//    want, but the issue is it's not a page (route?)
    final body = Container(
/*
MediaQuery is pretty nifty... the following below gets the size of the current
media and from what I am getting is it can readjust it's size as well to
whatever you want it to be.  So the widget will rebuild if the user rotates
their device
 */
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.deepPurple[900],
        ]),
      ),
      child: Column(
        children: <Widget>[an_image, welcome, randome_quote],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}