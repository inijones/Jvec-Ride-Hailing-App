import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_hailing_app/screens/app/map_page.dart';

class HomePage extends StatelessWidget {
  final String userEmail;

  const HomePage({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $userEmail!',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to login
                Get.offAllNamed('/login');
              },
              child: const Text('Logout'),
            ),
            const Expanded(
              child: MapPage(),
            ),
          ],
        ),
      ),
      
    );
  }
}
