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
        // Check if response data contains expected fields
        if (response.data != null && response.data is Map<String, dynamic>) {
          final responseData = response.data as Map<String, dynamic>;

          // Store data safely with null checks
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', responseData['token'] ?? '');
          prefs.setString('displayName', responseData['displayName'] ?? '');
          prefs.setString('email', responseData['email'] ?? '');

          // Log for debugging
          log('Token: ${responseData['token']}');
          log('Display Name: ${responseData['displayName']}');
          log('Email: ${responseData['email']}');

          return responseData;
        } else {
          log('Invalid response format: ${response.data}');
          return "Invalid response format from server";
        }
      } else {
        log('HTTP Error: ${response.statusCode}');
        return "Registration failed with status code: ${response.statusCode}";
      }
    } on DioException catch (e) {
      log('Dio Register error: ${e.message}');
      if (e.response != null) {
        log('Response status: ${e.response?.statusCode}');
        log('Response data: ${e.response?.data}');

        // Check for specific error messages from API
        if (e.response?.data != null &&
            e.response?.data is Map<String, dynamic> &&
            e.response?.data['message'] != null) {
          return e.response?.data['message'];
        }
      }
      return "The email already exists or server error occurred";
    } catch (e) {
      log('Register error: $e');
      return "Registration failed: $e";
    }
  }

  // Login Request
  Future<dynamic> loginUser(Map<String, dynamic> data) async {
    try {
      final response = await dio.post('$baseUrl/Auth/login', data: data);

      if (response.statusCode == 200) {
        // Check if response data contains expected fields
        if (response.data != null && response.data is Map<String, dynamic>) {
          final responseData = response.data as Map<String, dynamic>;

          // Store data safely with null checks
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', responseData['token'] ?? '');
          prefs.setString('displayName', responseData['displayName'] ?? '');
          prefs.setString('email', responseData['email'] ?? '');

          // Log for debugging
          log('Token: ${responseData['token']}');
          log('Display Name: ${responseData['displayName']}');
          log('Email: ${responseData['email']}');

          return responseData;
        } else {
          log('Invalid response format: ${response.data}');
          return "Invalid response format from server";
        }
      } else {
        log('HTTP Error: ${response.statusCode}');
        return "Login failed with status code: ${response.statusCode}";
      }
    } on DioException catch (e) {
      log('Dio Login error: ${e.message}');
      if (e.response != null) {
        log('Response status: ${e.response?.statusCode}');
        log('Response data: ${e.response?.data}');

        // Check for specific error messages from API
        if (e.response?.data != null &&
            e.response?.data is Map<String, dynamic> &&
            e.response?.data['message'] != null) {
          return e.response?.data['message'];
        }
      }
      return "The email or password you entered is incorrect, try again.";
    } catch (e) {
      log('Login error: $e');
      return "Login failed: $e";
    }
  }
}
