import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
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