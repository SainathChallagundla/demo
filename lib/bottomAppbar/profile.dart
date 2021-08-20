import 'package:demo/helpers/common.dart';
import 'package:flutter/material.dart';
import 'package:demo/sign_in.dart';
import 'package:demo/login.dart';
import 'package:demo/deviceInfo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.email, this.name, this.imageURL})
      : super(key: key);
  final String? email, name, imageURL;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: setAppBar("User Profile", context),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(widget.imageURL ?? ""),
                              fit: BoxFit.fill),
                        ),
                      )
                    ]),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: readOnlyBorderedTextFormField(widget.name!, "Name")),
                Padding(
                    padding: EdgeInsets.all(10),
                    child:
                        readOnlyBorderedTextFormField(widget.email!, "Email")),
                deviceInfo(),
                logOut() //loout button implementation
              ],
            ),
          ),
        ));
  }

//Logut method
  Widget logOut() {
    return OutlinedButton(
        onPressed: () {
          signOutGoogle();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()));
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          side: BorderSide(width: 2, color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.logout_sharp,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ));
  }

//Device info oage navigation method
  Widget deviceInfo() {
    return OutlinedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => DeviceInfo()));
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          side: BorderSide(width: 2, color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.perm_device_info,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Device Info',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
