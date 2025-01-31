import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hailing_app/controllers/driver_controller.dart';
import 'package:ride_hailing_app/controllers/ride_controller.dart';
import 'package:ride_hailing_app/models/driver_model.dart';
import 'package:ride_hailing_app/screens/app/widgets/driver_widget.dart';
import 'package:ride_hailing_app/screens/app/widgets/location_info_widget.dart';
import 'package:ride_hailing_app/widgets/buttons.dart';

class LocationInstructionModal extends StatelessWidget {
  const LocationInstructionModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),

          //
          Center(
            child: Container(
              height: 6,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 30),

          const LocationInfoWidget(),
          const SizedBox(height: 20),
          const LocationInfoWidget(
            assetPath: "assets/pin.png",
            locationName: "Pick Up Location",
            locationAddress: "Tap to select your pick up location",
          ),
          const SizedBox(height: 20),
          const LocationInfoWidget(
            assetPath: "assets/placeholder.png",
            locationName: "Drop Off Location",
            locationAddress: "Tap to select your drop off location",
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "Click the confirm button to continue",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff4168EB),
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          // User taps this button when he has noted the instructions
          AppButton(
            text: "Confirm Location",
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}

class FindDriverModal extends StatefulWidget {
  const FindDriverModal({super.key});

  @override
  State<FindDriverModal> createState() => _FindDriverModalState();
}

class _FindDriverModalState extends State<FindDriverModal> {
  bool showDriver = false;
  Driver selectedDriver = Driver(name: "", vehicleType: "", rating: 0.0);

  final List<Driver> mockDrivers = [
    Driver(name: "John Doe", vehicleType: "Toyota Corolla", rating: 4.8),
    Driver(name: "Jane Smith", vehicleType: "Honda Civic", rating: 4.7),
    Driver(name: "Mike Johnson", vehicleType: "Tesla Model 3", rating: 4.9),
  ];

  @override
  void initState() {
    final RideController rideController = Get.put(RideController());

    super.initState();
    rideController.findDriver();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(() {
          showDriver = true;
          selectedDriver = mockDrivers[Random().nextInt(mockDrivers.length)];
        });
      },
    );
    Future.delayed(
      const Duration(seconds: 25),
      () {
        setState(() {
          showDriver = false;
          selectedDriver = Driver(name: "", vehicleType: "", rating: 0.0);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final RideController rideController = Get.put(RideController());
    final FindingDriversController driverController =
        Get.put(FindingDriversController());

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => rideController.isFindingDriver.value
                ? Column(
                    children: [
                      const Text("Finding a driver..."),
                      const SizedBox(height: 16),
                      LinearProgressIndicator(
                          value: rideController.progress.value),
                      const SizedBox(height: 16),
                      // Show a random driver from our driver list
                      if (showDriver == true)
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/driver_image.png"),
                                // Name and rating
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedDriver.name,
                                    ),
                                    Text(
                                      "Rating: ⭐ ${selectedDriver.rating}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Row of vehicle type and ride completed
                            Row(
                              children: [
                                Image.asset("assets/car_icon.png"),
                                const SizedBox(width: 20),
                                Text(
                                  selectedDriver.vehicleType,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff4168EB),
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  "Rides Completed: ",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const Text(
                                  " 345",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff4168EB),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                      const SizedBox(height: 16),

                      if (showDriver == true)
                        AppButton(
                          onPressed: () => {
                            Get.back(),
                            driverController.showRideInfo(selectedDriver),
                          },
                          text: "Select Driver",
                          textColor: const Color(0xff4168EB),
                          buttonColor: Colors.white,
                        ),
                      const SizedBox(height: 16),
                      AppButton(
                        onPressed: rideController.cancelRequest,
                        text: "Cancel",
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const Text(
                        "No driver found. Try again?",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Currently we are not able to find a driver for you within your specified location. Please try again.",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      AppButton(
                        onPressed: rideController.findDriver,
                        text: "Retry",
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class RideInfoModal extends StatefulWidget {
  final Driver driver;
  const RideInfoModal({
    super.key,
    required this.driver,
  });

  @override
  State<RideInfoModal> createState() => _RideInfoModalState();
}

class _RideInfoModalState extends State<RideInfoModal> {
  bool showButton = true;

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void showLocalNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: '🚗 Ride Update',
        body: 'Your driver is arriving in 2 minutes!',
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Driver is on the way!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          DriverWidget(driver: widget.driver),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Vehicle:"),
              Text(
                widget.driver.vehicleType,
                style: GoogleFonts.roboto(
                  color: const Color(0xff4168EB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Plate Number:"),
              Text(
                "KHA 1234",
                style: GoogleFonts.roboto(
                  color: const Color(0xff4168EB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Car Color:"),
              Text(
                "Black",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Rating:"),
              Text(
                // star text
                " ⭐ ${widget.driver.rating}",
                style: GoogleFonts.roboto(
                  color: const Color(0xff4168EB),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Amount:"),
              Text(
                // star text
                " ₦5,000",
                style: GoogleFonts.roboto(
                  color: Colors.green,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text("Payment:"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Card:"),
              Text(
                // star text
                "**** **** **** 1234",
                style: GoogleFonts.roboto(
                  color: const Color(0xff4168EB),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (showButton == true)
            AppButton(
              onPressed: () => {
                showLocalNotification(),
                setState(() {
                  showButton = false;
                }),
              },
              text: "Confirm Ride",
            )
          else
            const SizedBox(height: 40),
        ],
      ),
    );
  }
}
