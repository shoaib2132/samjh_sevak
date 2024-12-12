import 'package:app/sceens/home/home_page.dart';
import 'package:app/sceens/login/login.dart';
import 'package:flutter/material.dart';

import 'sceens/SplashScreen/splash_screen.dart';
import 'sceens/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       initialRoute: '/splashScreen',
        routes: {
          '/': (context) => const SignInScreen(),
          '/home': (context) => const MyHomePage(title: '',),
          '/dashboard': (context) => const Dashboard(),
          '/splashScreen': (context) => const SplashScreen(),
        },
    );
  }
}

