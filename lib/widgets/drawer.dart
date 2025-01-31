import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Import GetX

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * 0.7,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff4168EB), // Consistent background color
            ),
            accountName: Text(
              'Eve Holt',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Prevent unnecessary expansion
              children: [
                Text(
                  'eve.holt@reqres.in',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4), // Adjust space
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Cash 2500',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor:
                  Colors.transparent, // Removes default border color
              radius: 40, // Adjust size if necessary
              child: ClipOval(
                child: Image.asset(
                  "assets/user_avatar.png",
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Home', style: GoogleFonts.poppins(fontSize: 16)),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            title: Text('History', style: GoogleFonts.poppins(fontSize: 16)),
            onTap: () {
              Get.toNamed('/history');
            },
          ),
          ListTile(
            title: Text('Settings', style: GoogleFonts.poppins(fontSize: 16)),
            onTap: () {
              // Get.toNamed('/settings');
            },
          ),
          ListTile(
            title: Text('Logout', style: GoogleFonts.poppins(fontSize: 16)),
            onTap: () {
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
