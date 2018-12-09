import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:splash_tokenauth/model/json/loginModel.dart';
import 'package:splash_tokenauth/common/functions/saveCurrentLogin.dart';
import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';

Future<LoginModel> requestLoginAPI(
    BuildContext context, String username, String password) async {
  final url = "http://192.168.1.129:3000/api/auth/login";
  // print(username);
  // print(password);
  Map<String, dynamic> body = {
    'email': username,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);
    print(responseJson);
    saveUsernameAndPasswordtoSharedPref(username, password);
    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    print(response.body);
    showDialogSingleButton(
        context,
        "Unable to Login",
        "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.",
        "OK");
    return null;
  }
}

Future<LoginModel> requestRegisterAPI(
    BuildContext context,
    String username,
    String password,
    String fname,
    String lname,
    String espid1,
    String espid2) async {
  final url = "http://192.168.1.105:3000/api/auth/register";

  Map<String, dynamic> body = {
    'email': username,
    'password': password,
    'fname': fname,
    'lname': lname,
    'espid1': espid1,
    'espid2': espid2
  };

  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var user = new LoginModel.fromJson(responseJson);
    print(user);
    saveUsernameAndPasswordtoSharedPref(username, password);
    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/HomeScreen');

    return LoginModel.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
    showDialogSingleButton(
        context,
        "Unable to Register",
        "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.",
        "OK");
    return null;
  }
}
