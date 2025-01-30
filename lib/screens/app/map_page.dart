import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_hailing_app/services/location_service.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController? mapController = MapController();
  bool _isMapReady = false;

  LatLng? currentPosition;
  LatLng? pickupLocation;
  LatLng? dropoffLocation;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      Position position = await LocationService().getCurrentLocation();

      if (!mounted) return;
      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
        log("Current Position: $currentPosition");
        if (_isMapReady && mapController != null && currentPosition != null) {
          mapController?.move(currentPosition!, 16);
        } else {
          log("Map not ready");
        }
      });
    } catch (e) {
      if (!mounted) return;
      debugPrint("Error fetching location: $e");
    }
  }

  // Function to handle map tap for selecting pickup or drop-off
  void _onTap(LatLng tappedLocation) {
    setState(
      () {
        if (pickupLocation == null) {
          pickupLocation = tappedLocation; // First tap is for pickup location
        } else {
          dropoffLocation ??= tappedLocation;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              log("Map is ready");
            },
            onTap: (tapPosition, latLng) {
              _onTap(latLng);
            },
          ),
          children: [
            TileLayer(
              // Display map tiles from any source
              urlTemplate:
                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
              userAgentPackageName: 'com.example.app',
              // And many more recommended properties!
            ),
            RichAttributionWidget(
              // Include a stylish prebuilt attribution widget that meets all requirments
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
                ],
              ),
          ],
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              if (_isMapReady) {
                mapController?.move(currentPosition!, 16);
              } else {
                log("Map is not ready yet!");
              }
            },
            child: const Icon(Icons.location_pin),
          ),
        ),
      ],
    );
  }
}
