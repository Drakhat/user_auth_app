import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'package:http/http.dart' as http;

final String url = "http://10.0.2.2:3002";

class Register extends StatelessWidget {
  TextEditingController usernamec = TextEditingController();
  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<int> attemptSignUp(
      String username, String password, String email) async {
    var res = await http.post("$url/users/signup",
        body: {"username": username, "password": password, "email": email});

    return res.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Register User"),
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          child: ListView(
            children: <Widget>[
              TextField(
                controller: usernamec,
                decoration: InputDecoration(hintText: "username"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: passwordc,
                obscureText: true,
                decoration: InputDecoration(hintText: "password"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: emailc,
                obscureText: true,
                decoration: InputDecoration(hintText: "email"),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Register"),
                onPressed: () async {
                  String email = emailc.text;
                  String username = usernamec.text;
                  String password = passwordc.text;
                  var res = await attemptSignUp(username, password, email);
                  if (res == 200) {
                    displayDialog(context, "Success",
                        "The user was created. Log in now.");
                  }
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Back to Login"),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
