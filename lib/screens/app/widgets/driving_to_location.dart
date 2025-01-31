import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hailing_app/models/driver_model.dart';
import 'package:ride_hailing_app/screens/app/widgets/driver_widget.dart';
import 'package:ride_hailing_app/widgets/buttons.dart';

class DrivingToLocationModal extends StatefulWidget {
  final Driver driver;

  const DrivingToLocationModal({super.key, required this.driver});

  @override
  State<DrivingToLocationModal> createState() => _DrivingToLocationModalState();
}

class _DrivingToLocationModalState extends State<DrivingToLocationModal> {
  @override
  Widget build(BuildContext context) {
    bool showConfirmButton = true;

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
          const LinearProgressIndicator(),
          const SizedBox(height: 20),
          DriverWidget(driver: widget.driver),
          const SizedBox(height: 30),
          Row(
            children: [
              Image.asset("assets/locate_icon.png", height: 14, width: 14),
              const SizedBox(width: 10),
              const Text(
                "Your Location",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Image.asset("assets/destination_icon.png", height: 14, width: 14),
              const SizedBox(width: 10),
              const Text(
                "Your Destination",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Image.asset(
                "assets/car_icon.png",
              ),
              const Spacer(),
              SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Text(
                      "Distance",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "3Km",
                      style: GoogleFonts.roboto(
                        color: const Color(0xff4168EB),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Text(
                      "Price",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      // naira
                      "₦5,000",
                      style: GoogleFonts.roboto(
                        color: const Color(0xff4168EB),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Text(
                      "Time",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "30min",
                      style: GoogleFonts.roboto(
                        color: const Color(0xff4168EB),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          if (showConfirmButton == false)
            const CircularProgressIndicator()
          else
            AppButton(
              onPressed: () => {
                setState(() {
                  showConfirmButton = false;
                })
              },
              text: "Cancel Ride",
            ),
        ],
      ),
    );
  }
}
