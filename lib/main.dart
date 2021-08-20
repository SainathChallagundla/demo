import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demo/homepage.dart';
import 'package:demo/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences pref = await SharedPreferences.getInstance();
  String email = pref.getString("email") ?? "";
  String name = pref.getString("name") ?? "";
  String imageURL = pref.getString("imageUrl") ?? "";

  // Set default home.
  Widget _defaultHome = new LoginPage();
  print("---------------$email");
  if (email != "") {
    _defaultHome = HomePage(
      email: email,
      name: name,
      imageURL: imageURL,
    );
  }

  // Run app!
  runApp(new MaterialApp(
      title: 'Task',
      home: _defaultHome,
      theme: new ThemeData(
        primaryColor: Colors.teal,
        primaryColorDark: Colors.teal[900],
      )));
}
