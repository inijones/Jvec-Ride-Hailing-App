import 'package:flutter/material.dart';
import 'package:ride_hailing_app/screens/app/map_page.dart';

class HomePage extends StatelessWidget {
  final String userEmail;

  const HomePage({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: MapPage(),
          ),
        ],
      ),
    );
  }
}
