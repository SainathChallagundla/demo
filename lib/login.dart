import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'helpers/localStore.dart';
import 'package:demo/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //String email, name, imageURL;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.tealAccent, Colors.blue],
          ),
        ),
        // color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                 // shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image:AssetImage("assets/images/flutter.png"),
                      fit: BoxFit.fill),
                ),
              ),
              Text("Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.teal)),
              Text("To",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.teal)),
              Text("Task",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.teal)),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlinedButton(
      onPressed: () async {
        await _onSignIn();
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        side: BorderSide(width: 2, color: Colors.blueGrey),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onSignIn() async {
    try {
      var result = await signInWithGoogle();
      if (result != "failure") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return HomePage(
              email: email,
              name: name,
              imageURL: imageUrl,
            );
          },
        ));
      } else {
        final snackBar = SnackBar(
            duration: Duration(seconds: 5),
            content: Text(
                'Seems some Google Services are missing.Please update and signin again.'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      await removeAll(); // Remove everything
      final snackBar = SnackBar(
          duration: Duration(seconds: 10),
          content: Text(
              'Some problem during signin process.Please contact synctrainer@snapminds.in'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("failed to signin");
    }
  }
}
