import 'package:demo/helpers/common.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:demo/sign_in.dart';
import 'package:demo/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.email, this.name, this.imageURL})
      : super(key: key);
  final String? email, name, imageURL;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late AndroidDeviceInfo? androidInfo;
  void getdeviceinfo() async {
    androidInfo = await deviceInfo.androidInfo;
    setState(() {
      model = androidInfo!.model;
    });
  }

  // DeviceInfoPlugin? deviceInfo =
  //     DeviceInfoPlugin(); // instantiate device info plugin
  // AndroidDeviceInfo? androidDeviceInfo;
  String? board,
      brand,
      device,
      hardware,
      host,
      id,
      manufacture,
      model,
      product,
      type,
      androidid;
  bool? isphysicaldevice;
  // @override
  // void initState() {
  //   super.initState();
  //   getDeviceinfo();
  // }

  // void getDeviceinfo() async {
  //   androidDeviceInfo = await deviceInfo!
  //       .androidInfo; // instantiate Android Device Infoformation
  //   setState(() {
  //     board = androidDeviceInfo?.board ?? "";
  //     brand = androidDeviceInfo?.brand;
  //     device = androidDeviceInfo?.device;
  //     hardware = androidDeviceInfo!.hardware;
  //     host = androidDeviceInfo!.host;
  //     id = androidDeviceInfo!.id;
  //     manufacture = androidDeviceInfo!.manufacturer;
  //     model = androidDeviceInfo?.model??"";
  //     product = androidDeviceInfo!.product;
  //     type = androidDeviceInfo!.type;
  //     isphysicaldevice = androidDeviceInfo!.isPhysicalDevice;
  //     androidid = androidDeviceInfo!.androidId;
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdeviceinfo();
  }

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
                Padding(
                    padding: EdgeInsets.all(10),
                    child:
                        readOnlyBorderedTextFormField(model!, "Device Name")),
                logOut()
              ],
            ),
          ),
        ));
  }

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
}
