import 'dart:convert';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    
    name: 'Test Test',
    email: 'test.test@gmail.com',
    aboutMeDescription:'fuck',
    gender: 'Female',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
  final json = _preferences.getString(_keyUser);

  return json == null ? myUser : User.fromJson(jsonDecode(json) as Map<String, dynamic>);
}
}