import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ride_hailing_app/screens/app/home_page.dart';
import 'package:ride_hailing_app/screens/auth/login_page.dart';
import 'package:ride_hailing_app/screens/auth/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/sign-up', page: () => SignUpPage()),
        // Add more routes for your app
        GetPage(name: '/home', page: () => const HomePage(userEmail: '')),
      ],
    );
  }
}
