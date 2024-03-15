import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupApiService {
  Future<void> registerUser(String username, String email, String password, String gender) async {  
    final response = await http.post(
      Uri.parse(''), // add flask API.
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
        'gender': gender,  
      }),
    );

    if (response.statusCode == 200) {
      print('User registered successfully');
    } else {
      throw Exception('Failed to register user');
    }
  }
}

class LoginApiService {
  Future<void> login(String email, String password) async {
    var url = Uri.parse(''); // add flask api.

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('User logged in successfully');
    } else {
      throw Exception('Failed to log in');
    }
  }
}