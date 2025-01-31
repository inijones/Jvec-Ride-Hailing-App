import 'package:flutter/material.dart';
import 'package:ride_hailing_app/models/driver_model.dart';

class DrivingToLocationModal extends StatelessWidget {
  final Driver driver;

  const DrivingToLocationModal({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Drving to your Destination!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text("${driver.name} • ${driver.vehicleType}"),
          Text("⭐ ${driver.rating}"),
          const SizedBox(height: 20),
          const LinearProgressIndicator(minHeight: 6),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
