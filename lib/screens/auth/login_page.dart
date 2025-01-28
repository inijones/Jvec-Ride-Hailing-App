import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing_app/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Obx(
              () {
                return _authController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          _authController.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                        },
                        child: const Text('Login'),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
