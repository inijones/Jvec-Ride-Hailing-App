import 'dart:developer';

import 'package:get/get.dart';
import 'package:ride_hailing_app/screens/app/home_page.dart';
import 'package:ride_hailing_app/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final response = await _authService.login(email, password);
      final token = response.data['token'];
      log('Login successful: $token');
      Get.offNamed('/home'); // Navigate to home screen
      Get.offAll(() => HomePage(userEmail: email));
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    isLoading.value = true;
    try {
      final response = await _authService.signUp(email, password);
      log('Sign Up successful: ${response.data}');
      Get.offNamed('/login'); // Navigate to login screen
      Get.offAll(() => HomePage(userEmail: email));
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
