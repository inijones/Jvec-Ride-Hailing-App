import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void showTripCompletedDialog() {
  Get.dialog(const TripCompleteDialog());
}

class TripCompleteDialog extends StatefulWidget {
  const TripCompleteDialog({super.key});

  @override
  State<TripCompleteDialog> createState() => _TripCompleteDialogState();
}

class _TripCompleteDialogState extends State<TripCompleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Image.asset(
            "assets/check-circle.png",
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 30),
          Text(
            "Trip Completed",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      content: const Text(
        "Your trip has been successfully completed. Thank you for riding with us!",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Cancel",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff4168EB),
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            "Done",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
