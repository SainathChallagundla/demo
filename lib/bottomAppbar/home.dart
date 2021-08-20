import 'package:demo/helpers/common.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({ Key? key, this.email, this.name, this.imageURL }) : super(key: key);

  final String? email, name, imageURL;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar("Home", context),
      body: Center(child: Text("Home"),),
    );
  }
}