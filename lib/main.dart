import 'package:flutter/foundation.dart'; // Import foundation.dart for kReleaseMode
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Import device_preview

import 'package:catlog_app/pages/home.dart';
import 'package:catlog_app/pages/login.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Enable DevicePreview only in debug or profile mode
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
      },
      locale: DevicePreview.locale(context), // Use the device's locale
      builder: DevicePreview.appBuilder, // Make sure the DevicePreview builder is applied
    );
  }
}
