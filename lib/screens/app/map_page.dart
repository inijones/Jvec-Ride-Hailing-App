import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_hailing_app/controllers/driver_controller.dart';
import 'package:ride_hailing_app/screens/app/widgets/driver_modal.dart';
import 'package:ride_hailing_app/services/location_service.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController? mapController = MapController();
  bool _isMapReady = false;

  LatLng? currentPosition;
  LatLng? pickupLocation;
  LatLng? dropoffLocation;
  List<LatLng> carLocations = [];

  var polylines = <Polyline>[].obs;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  Future<void> _getUserLocation() async {
    try {
      Position position = await LocationService().getCurrentLocation();

      if (!mounted) return;
      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
        debugPrint("Current Position: $currentPosition");
        if (_isMapReady && mapController != null && currentPosition != null) {
          mapController?.move(currentPosition!, 16);
          Future.delayed(const Duration(seconds: 1), () {
            Get.bottomSheet(const LocationInstructionModal());
          });
        } else {
          debugPrint("Map not ready");
        }
      });
    } catch (e) {
      if (!mounted) return;
      debugPrint("Error fetching location: $e");
    }
  }

  // Function to handle map tap for selecting pickup or drop-off
  void _onTap(LatLng tappedLocation) {
    final FindingDriversController controller =
        Get.put(FindingDriversController());
    setState(
      () {
        if (pickupLocation == null) {
          pickupLocation = tappedLocation;
        } else {
          dropoffLocation ??= tappedLocation;
          carLocations = generateCarLocations(currentPosition!);
          controller.findDriver();
        }
      },
    );
  }

  List<LatLng> generateCarLocations(LatLng userLocation) {
    Random random = Random();
    List<LatLng> carLocations = [];

    for (int i = 0; i < 3; i++) {
      double offsetLat = (random.nextDouble() - 0.5) / 333; // ~300m offset
      double offsetLng = (random.nextDouble() - 0.5) / 333;

      carLocations.add(LatLng(
        userLocation.latitude + offsetLat,
        userLocation.longitude + offsetLng,
      ));
    }

    return carLocations;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height - 300,
      child: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: currentPosition ??
                  const LatLng(6.5866, 3.3530), // Center the map over London
              initialZoom: 14,
              onMapReady: () {
                // Ensure the map is ready before using controller
                setState(() {
                  _isMapReady = true;
                });
                debugPrint("Map is ready");
              },
              onTap: (tapPosition, latLng) {
                _onTap(latLng);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () => launchUrl(Uri.parse(
                        'https://openstreetmap.org/copyright')), // (external)
                  ),
                  // Also add images...
                ],
              ),
              if (currentPosition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentPosition!,
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        'assets/location1.png', // Your custom bitmap
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (pickupLocation != null)
                      Marker(
                        point: pickupLocation!,
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/pin.png', // Your custom bitmap
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (dropoffLocation != null)
                      Marker(
                        point: dropoffLocation!,
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/placeholder.png', // Your custom bitmap
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    for (var car in carLocations)
                      Marker(
                        point: car,
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          "assets/car_map_icon.png",
                          width: 30,
                        ),
                      ),
                  ],
                ),
            ],
          ),

          // Loading indicator for current location
          if (currentPosition == null)
            const Positioned(
              child: LinearProgressIndicator(
                minHeight: 8,
                backgroundColor: Colors.white,
                color: Color(0xff4168EB),
              ),
            ),

          Positioned(
            top: 50,
            left: 10,
            child: GestureDetector(
              onTap: () {
                widget.scaffoldKey.currentState
                    ?.openDrawer(); // Open the drawer
              },
              child: Image.asset(
                "assets/user_avatar.png",
                height: 60,
                width: 60,
              ),
            ),
          ),

          // Floating buttons for cancelling pickup, drop-off and current location
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      dropoffLocation = null;
                      pickupLocation = null;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/cancel_icon.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_isMapReady) {
                      mapController?.move(currentPosition!, 16);
                    } else {
                      debugPrint("Map is not ready yet!");
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/current_icon.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* GestureDetector(
              onDoubleTap: () => Get.bottomSheet(
                const CustomDrawer(),
                isScrollControlled: true, // Makes it full screen if necessary
                backgroundColor: Colors.white,
              ),
              child: Image.asset(
                "assets/user_avatar.png",
                height: 60,
                width: 60,
              ),
            ), */

