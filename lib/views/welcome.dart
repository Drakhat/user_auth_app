import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          child: ListView(
            children: <Widget>[Text("Helo Test")],
          ),
        ),
      ),
    );
  }
}
