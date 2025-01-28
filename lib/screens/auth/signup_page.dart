import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing_app/controllers/auth_controller.dart';
import 'package:ride_hailing_app/widgets/buttons.dart';
import 'package:ride_hailing_app/widgets/textfield_widget.dart';

class SignUpPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            BackButtonWidget(
              onPressed: () => Get.back(),
            ),

            const SizedBox(height: 30),

            // Hi! and Welcome Back!
            const Text(
              "Let's",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Color(0xff4168EB),
              ),
              textAlign: TextAlign.left,
            ),
            const Text(
              'Get Started!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Color(0xff4168EB),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 50),

            // Please login
            const Text(
              'Please fill all the details to create an account',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),

            const SizedBox(height: 20),

            // Name
            RoundedTextField(
              controller: _nameController,
              hintText: 'Enter Name',
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              controller: _emailController,
              hintText: 'Enter Email',
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              controller: _phoneNumberController,
              hintText: 'Enter Phone Number',
            ),
            const SizedBox(height: 10),
            RoundedTextField(
              controller: _passwordController,
              hintText: 'Enter Password',
            ),

            const SizedBox(height: 40),
            Obx(
              () {
                return _authController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff4168EB),
                        ),
                      )
                    : AppButton(
                        text: 'Sign Up',
                        onPressed: () {
                          _authController.signUp(
                            _nameController.text,
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
                  "Already have an account? ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 14,
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
    );
  }
}
