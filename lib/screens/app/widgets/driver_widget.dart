
import 'package:flutter/material.dart';
import 'package:ride_hailing_app/models/driver_model.dart';

class DriverWidget extends StatelessWidget {
  const DriverWidget({
    super.key,
    required this.driver,
  });

  final Driver driver;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset("assets/driver_image.png", height: 50, width: 50),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/driver_icon.png",
                      height: 14,
                      width: 14,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Your Driver",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  driver.name,
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              "assets/call_icon.png",
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 10),
            Image.asset(
              "assets/message_rider_icon.png",
              height: 50,
              width: 50,
            ),
          ],
        ),
      ],
    );
  }
}
