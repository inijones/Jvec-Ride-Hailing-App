import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing_app/controllers/auth_controller.dart';
import 'package:ride_hailing_app/widgets/buttons.dart';
import 'package:ride_hailing_app/widgets/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              BackButtonWidget(
                onPressed: () => Get.back(),
              ),

              // Image
              // Center(
              //   child: Image.asset(
              //     "assets/jvec_logo.jpeg",
              //   ),
              // ),

              const SizedBox(height: 20),

              // Hi! and Welcome Back!
              const Text(
                "Hey,",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4168EB),
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4168EB),
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 50),

              // Please login
              const Text(
                'Please login to continue',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),

              const SizedBox(height: 20),

              // Email and Password
              RoundedTextField(
                controller: _emailController,
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 20),
              RoundedTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
              ),
              const SizedBox(height: 60),

              // Login Button
              Obx(
                () {
                  return _authController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff4168EB),
                          ),
                        )
                      : AppButton(
                          text: 'Login',
                          onPressed: () {
                            _authController.login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          },
                        );
                },
              ),
              const SizedBox(height: 40),

              // Don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/sign-up');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4168EB),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
