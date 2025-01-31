import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_hailing_app/screens/app/home_page.dart';
import 'package:ride_hailing_app/screens/auth/login_page.dart';
import 'package:ride_hailing_app/screens/auth/signup_page.dart';
import 'package:ride_hailing_app/screens/onboarding/location_page.dart';
import 'package:ride_hailing_app/screens/onboarding/onboarding_page.dart';
import 'package:ride_hailing_app/screens/onboarding/splash_page.dart';
import 'package:ride_hailing_app/screens/app/history_page.dart';
import 'package:ride_hailing_app/widgets/drawer.dart';
import 'package:awesome_notifications/awesome_notifications.dart'
    as awesome_notification;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  AwesomeNotifications().initialize(
    'resource://drawable/jvec_logo', // App icon
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic alerts',
         onlyAlertOnce: true,
        defaultColor: Colors.blue,
        importance: NotificationImportance.High,
        ledColor: Colors.white,
      ),
    ],
    debug: true,
  );

   awesome_notification.AwesomeNotifications().setListeners(
    onActionReceivedMethod: NotificationController.onActionReceivedMethod,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium:
              GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.poppins(fontSize: 16),
          displayMedium:
              GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        primarySwatch: Colors.blue,
      ),
      getPages: [
        // Onboarding Pages
        GetPage(name: '/splash', page: () => const SplashPage()),
        GetPage(name: '/onboarding', page: () => const OnboardingPage()),
        GetPage(name: '/location', page: () => const LocationRequestPage()),
        // Auth Pages
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/sign-up', page: () => SignUpPage()),
        // App Pages
        GetPage(name: '/home', page: () => HomePage(userEmail: '')),
        GetPage(name: '/drawer', page: () => const CustomDrawer()),
        GetPage(name: '/history', page: () => const HistoryPage()),
      ],
    );
  }
}

class NotificationController {
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.payload != null) {
      String? screen = receivedAction.payload!['screen'];
      if (screen != null) {
        if (screen == 'sync') {
          // navigatorKey.currentState?.pushNamed(
          //   '/sync',
          //   arguments: receivedAction.payload,
          // );
        }
      }
    }
  }
}
