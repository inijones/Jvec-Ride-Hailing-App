import 'package:get/get.dart';
import 'package:ride_hailing_app/models/driver_model.dart';
import 'package:ride_hailing_app/screens/app/widgets/driver_modal.dart';
import 'package:ride_hailing_app/screens/app/widgets/driving_to_location.dart';
import 'package:ride_hailing_app/screens/app/widgets/show_trip_complete_dialog.dart';

class FindingDriversController extends GetxController {
  var isFindingDriver = false.obs;
  var selectedDriver = Rxn<Driver>();

  // Driver Functions
  void findDriver() {
    isFindingDriver.value = true;
    Get.bottomSheet(const FindDriverModal());
  }

  void showRideInfo(Driver driver) {
    selectedDriver.value = driver;
    Get.bottomSheet(RideInfoModal(driver: driver));

    // After 3 seconds, show "Driving to Location" modal
    Future.delayed(const Duration(seconds: 10), () {
      Get.back();
      Get.bottomSheet(DrivingToLocationModal(driver: driver));

      // After another 10 seconds, complete the trip
      // Future.delayed(const Duration(seconds: 10), () {
      //   Get.back(); // Close "Driving to Location" modal
      //   showTripCompletedDialog(); // Show trip completed alert
      // });
    });
  }
}
