import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vida/services/constant/api_uri.dart';

class AuthServices {
  final Dio dio = Dio();

  // Register Request
  Future<dynamic> registerUser(Map<String, dynamic> data) async {
    try {
      final response = await dio.post('$baseUrl/Auth/register', data: data);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response.data['token']);
        prefs.setString('displayName', response.data['displayName']);
        prefs.setString('email', response.data['email']);
        log(response.data['token']);
        log(response.data['displayName']);
        log(response.data['email']);
        return response.data;
      }
    } catch (e) {
      // You can log the error or rethrow it
      log('Register error: $e');
      return "the email already exists";
    }
  }

  // Login Request
  Future<dynamic> loginUser(Map<String, dynamic> data) async {
    try {
      final response = await dio.post('$baseUrl/Auth/login', data: data);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response.data['token']);
        prefs.setString('displayName', response.data['displayName']);
        prefs.setString('email', response.data['email']);
        log(response.data['token']);
        log(response.data['displayName']);
        log(response.data['email']);
        return response.data;
      }
    } catch (e) {
      log('Login error: $e');
      return "The email or password you entered is incorrect, try again.";
    }
  }
}
