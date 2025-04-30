import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:vida/auth_cubit/app_stata.dart';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vida/services/constant/api_uri.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final Dio dio = Dio();

  Future<dynamic> registerUser(
    String name,
    String password,
    String email,
    String phoneNumber,
  ) async {
    emit(RegisterLoadingState());
    try {
      final response = await dio.post(
        '$baseUrl/Auth/register',
        data: {
          "displayName": name,
          "password": password,
          "email": email,
          "phoneNumber": phoneNumber,
        },
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final responseData = response.data as Map<String, dynamic>;
        final prefs = await SharedPreferences.getInstance();

        prefs.setString('token', responseData['token']?.toString() ?? '');
        prefs.setString('displayName', responseData['displayName'] ?? '');
        prefs.setString('email', responseData['email'] ?? '');
        prefs.setString('userId', responseData['id']?.toString() ?? '');

        log('Token: ${responseData['token']}');
        log('Display Name: ${responseData['displayName']}');
        log('Email: ${responseData['email']}');
        log('User ID: ${responseData['id']}');

        emit(RegisterSuccessState());
        return responseData;
      } else {
        final message =
            "Registration failed with status code: ${response.statusCode}";
        log(message);
        emit(FailedToRegisterState(message: message));
        return {"success": false, "message": message};
      }
    } on DioException catch (e) {
      log('Dio Register error: ${e.message}');
      if (e.response != null) {
        log('Response status: ${e.response?.statusCode}');
        log('Response data: ${e.response?.data}');

        if (e.response?.data != null &&
            e.response?.data is Map<String, dynamic> &&
            e.response?.data['message'] != null) {
          final errorMessage = e.response?.data['message'];
          emit(FailedToRegisterState(message: errorMessage));
          return {"success": false, "message": errorMessage};
        }
      }
      final error = "The email already exists or server error occurred";
      emit(FailedToRegisterState(message: error));
      return {"success": false, "message": error};
    }
  }

  Future<dynamic> loginUser(
    Map<String, dynamic> data,
    String email,
    String password,
  ) async {
    emit(LoginLoadingState());
    try {
      final response = await dio.post(
        '$baseUrl/Auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final responseData = response.data as Map<String, dynamic>;
        final prefs = await SharedPreferences.getInstance();

        prefs.setString('token', responseData['token']?.toString() ?? '');
        prefs.setString('displayName', responseData['displayName'] ?? '');
        prefs.setString('email', responseData['email'] ?? '');
        prefs.setString('userId', responseData['id']?.toString() ?? '');

        log('Token: ${responseData['token']}');
        log('Display Name: ${responseData['displayName']}');
        log('Email: ${responseData['email']}');
        log('User ID: ${responseData['id']}');

        emit(LoginSuccessState());
        return responseData;
      } else {
        final message = "Login failed with status code: ${response.statusCode}";
        log(message);
        emit(FailedToLoginState(message: message));
        return {"success": false, "message": message};
      }
    } on DioException catch (e) {
      log('Dio Login error: ${e.message}');
      if (e.response != null) {
        log('Response status: ${e.response?.statusCode}');
        log('Response data: ${e.response?.data}');

        if (e.response?.data != null &&
            e.response?.data is Map<String, dynamic> &&
            e.response?.data['message'] != null) {
          final errorMessage = e.response?.data['message'];
          emit(FailedToLoginState(message: errorMessage));
          return {"success": false, "message": errorMessage};
        }
      }
      final error =
          "The email or password you entered is incorrect, try again.";
      emit(FailedToLoginState(message: error));
      return {"success": false, "message": error};
    }
  }
}
