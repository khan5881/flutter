import 'package:shared_preferences/shared_preferences.dart';

getToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  String getToken = await preferences.getString("LastToken");
  return getToken;
}

getEmail() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();

  String getEmail = await preferences.getString("email");
  return getEmail;
}

getPassword() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();

  String getPassword = await preferences.getString("password");
  return getPassword;
}

