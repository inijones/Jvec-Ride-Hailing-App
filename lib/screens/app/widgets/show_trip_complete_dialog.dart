import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showTripCompletedDialog() {
  Get.dialog(
    AlertDialog(
      title: const Text("Trip Completed ✅"),
      content: const Text("Your trip has been successfully completed. Thank you for riding with us!"),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text("OK"),
        ),
      ],
    ),
  );
}
