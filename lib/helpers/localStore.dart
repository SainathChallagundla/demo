import 'package:shared_preferences/shared_preferences.dart';

addSignInDetailstoSF(String name, email, imageUrl) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  prefs.setString('email', email);
  prefs.setString('imageUrl', imageUrl);
}

removeAll() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
