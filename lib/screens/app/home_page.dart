import 'package:flutter/material.dart';
import 'package:ride_hailing_app/screens/app/map_page.dart';
import 'package:ride_hailing_app/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final String userEmail;

  HomePage({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: MapPage(
              scaffoldKey: scaffoldKey,
            ),
          ),
        ],
      ),
    );
  }
}
