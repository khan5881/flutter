import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:splash_tokenauth/common/functions/saveCurrentLogin.dart';
import 'package:splash_tokenauth/common/functions/showDialogSingleButton.dart';
import 'package:splash_tokenauth/common/functions/getToken.dart';
import 'package:splash_tokenauth/model/json/serverDataModel.dart';

Future<List<ServerDataModel>> requestServerDataAPI() async {
  final url= "http://192.168.1.129:3000/dailyval_one";

  final response = await http.get(
    url,
    headers: {"x-access-token": await getToken()},
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    // print(responseJson);
    final items =
        (responseJson as List).map((i) => new ServerDataModel.fromJson(i));
    return items.toList();
  }
  return [];
}

// Future<List<ServerDataModel>> requestServerDataAPI2() async {
//   final url= "http://192.168.1.129:3000/latest_hour2";

//   final response = await http.get(
//     url,
//     headers: {"x-access-token": await getToken()},
//   );

//   if (response.statusCode == 200) {
//     final responseJson = json.decode(response.body);
//     // print(responseJson);
//     final items =
//         (responseJson as List).map((i) => new ServerDataModel.fromJson(i));
//     return items.toList();
//   }
//   return [];
// }
