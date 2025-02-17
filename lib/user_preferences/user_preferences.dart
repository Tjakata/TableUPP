import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_data.dart';

class RememberUserProfs {

  static Future<void> rememberUser (User userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJsonData);
  }

}