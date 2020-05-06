import 'package:flutter/material.dart';
import 'package:userauthapp/views/login.dart';

void main()=>runApp(Home());
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Auth App"),
        ),
        body: Homescreen(),
      ),
    );
  }
}