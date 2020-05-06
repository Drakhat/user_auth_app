import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userauthapp/views/register.dart';
import 'package:userauthapp/views/welcome.dart';
import 'package:http/http.dart' as http;

final String url = "http://10.0.2.2:3002";

class Homescreen extends StatelessWidget {
  TextEditingController usernamec = TextEditingController();
  TextEditingController passwordc = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<String> attemptLogIn(String username, String password) async {
    var res = await http.post("$url/users/login", body: {
      "username": username,
      "password": password,
    });
    if (res.statusCode == 200) return res.body;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          RaisedButton(
              child: Text("Login"),
              onPressed: () async {
                String username = usernamec.text;
                String password = passwordc.text;
                var ress = await attemptLogIn(username, password);
                if (ress != null)
                  return Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScr()));
              }),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text("Register"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register()));
            },
          )
        ],
      ),
    );
  }
}
