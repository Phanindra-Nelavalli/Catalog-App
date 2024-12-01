import 'package:flutter/material.dart';
import 'package:catlog_app/widgets/themes.dart';
import 'package:catlog_app/pages/home.dart';
import 'package:catlog_app/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
      },
    );
  }
}
