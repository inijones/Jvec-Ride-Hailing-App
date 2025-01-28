import 'dart:developer';

import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'email': email,
        'password': password,
      });
      log("Response: ${response.toString()}");
      return response;
    } on DioException catch (e) {
      throw e.response?.data['error'] ?? 'An error occurred';
    }
  }

  Future<Response> signUp(String email, String password) async {
    try {
      final response = await _dio.post('/register', data: {
        'email': email,
        'password': password,
      });
      log("Response: ${response.toString()}");
      return response;
    } on DioException catch (e) {
      throw e.response?.data['error'] ?? 'An error occurred';
    }
  }
}
