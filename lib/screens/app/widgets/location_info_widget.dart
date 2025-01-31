import 'package:flutter/material.dart';

class LocationInfoWidget extends StatelessWidget {
  const LocationInfoWidget({
    super.key,
    this.assetPath,
    this.locationName,
    this.locationAddress,
  });

  final String? assetPath;
  final String? locationName;
  final String? locationAddress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          assetPath ?? "assets/location1.png",
          height: 35,
          width: 35,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locationName ?? "PICKUP",
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              locationAddress ?? "Your current location",
              style: const TextStyle(
                fontSize: 14,
                color: Color(
                  0xff242E42,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}