import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parangessos_routes/models/profil/user.dart';
import 'package:parangessos_routes/utils/constants.dart';
import 'package:universal_platform/universal_platform.dart';

class Api {

  static Future login(String pseudo, String password) async {
    String url = '';
    if(UniversalPlatform.isAndroid){
      url = "http://10.0.2.2:3000/login";
    }else if (UniversalPlatform.isWeb || UniversalPlatform.isIOS){
      url = "http://localhost:3000/login";
    }
    Map<String, String> headers = {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };
    try {
      final response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: {
            "pseudo": pseudo,
            "password": password
          },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response);
        var test = jsonDecode(response.body);
        print(test);
        userLog = User.fromJson(test[0]);
        print(userLog);
        return true;
      } else {
        print(response.body);
        print(response.statusCode);
        errorLog = jsonDecode(response.body);
        return false;
      }
    } on Exception catch (e) {
      print(e);
      print(Exception);
      print("Error occured");
    }
  }

  static Future register(String pseudo, String password, String mail) async {
    String url = '';
    if(UniversalPlatform.isAndroid){
      url = "http://10.0.2.2:3000/register";
    }else if (UniversalPlatform.isWeb || UniversalPlatform.isIOS){
      url = "http://localhost:3000/register";
    }
    Map<String, String> headers = {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: {
          "pseudo": pseudo,
          "password": password,
          "mail": mail},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var test = jsonDecode(response.body);
        print(test);
        userLog = User.fromJson(test[0]);
        return true;
      } else {
        print(response.body);
        print(response.statusCode);
        errorLog = jsonDecode(response.body[0]);
        return false;
      }
    } on Exception catch (e) {
      print(e);
      print(Exception);
      print("Error occured");
    }
  }
}