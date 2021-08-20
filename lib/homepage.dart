import 'package:demo/bottomAppbar/home.dart';
import 'package:demo/bottomAppbar/location.dart';
import 'package:demo/bottomAppbar/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.email, this.name, this.imageURL})
      : super(key: key);

  final String? email, name, imageURL;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    _children = [Home(), LocationPage(), ProfilePage(email: widget.email,name: widget.name,imageURL: widget.imageURL,)];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: getbottomnavigationbar(),
    );
  }

  Widget? getbottomnavigationbar() {
    return BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        backgroundColor: Colors.teal[300],
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_history), label: "Location"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Profile")
        ]);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
