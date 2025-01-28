import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:ride_hailing_app/widgets/buttons.dart';

class LocationRequestPage extends StatelessWidget {
  const LocationRequestPage({super.key});

  Future<void> _requestLocationPermission() async {
    Get.toNamed('/login');
    final status = await Permission.location.request();
    if (status.isGranted) {
      Get.toNamed('/login');
    } else {
      Get.snackbar(
          'Permission Denied', 'Location access is required to proceed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Permission'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Image.asset("assets/location_image.png"),
          const Expanded(
            flex: 5,
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  'Hi, nice to meet you!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4168EB),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Choose your location to start find restaurants around you.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          UseCurrentLocationButton(
            onPressed: _requestLocationPermission,
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
