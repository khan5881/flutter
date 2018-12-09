import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_tokenauth/model/json/loginModel.dart';

saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  var user;
  if ((responseJson != null && !responseJson.isEmpty)) {
    user = LoginModel.fromJson(responseJson);
  } else {
    user = "";
  }
  var token = (responseJson != null && !responseJson.isEmpty)
      ? LoginModel.fromJson(responseJson).token
      : "";

  await preferences.setString(
      'LastToken', (token != null && token.length > 0) ? token : "");
}

saveUsernameAndPasswordtoSharedPref (String username, String password) async{
SharedPreferences preferences = await SharedPreferences.getInstance();

  await preferences.setString(
      'email', (username != null && username.length > 0) ? username : "");
      await preferences.setString(
      'password', (password != null && password.length > 0) ? password : "");
}
