import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  nextPage() {
    Timer(const Duration(milliseconds: 1000),
        () => Navigator.pushReplacementNamed(context, '/'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/sidebar.jpeg',
      fit: BoxFit.fill,
    );
  }
}
