import 'dart:async';
import 'package:get/get.dart';
import 'package:ride_hailing_app/models/driver_model.dart';

class RideController extends GetxController {
  Rx<Driver?> selectedDriver = Rx<Driver?>(null);
  RxBool isFindingDriver = true.obs;
  RxDouble progress = 0.0.obs;
  Timer? _timer;

  @override
  void onInit() {
    // _initializeNotifications();
    super.onInit();
  }

  Future<void> findDriver() async {
    isFindingDriver.value = true;
    progress.value = 0.0;
    selectedDriver.value = null;

    int secondsPassed = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsPassed++;
      progress.value = secondsPassed / 30; // Progress for 15s

      if (secondsPassed >= 30) {
        timer.cancel();
        isFindingDriver.value = false;
        selectedDriver.value = null;
      }
    });
  }

  void cancelRequest() {
    _timer?.cancel();
    isFindingDriver.value = false;
    progress.value = 0.0;
  }
}
