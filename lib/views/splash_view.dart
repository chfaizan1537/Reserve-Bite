import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:reservebite/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(RoutesNames.rolescreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
          colors: [
            Color(0xFFF5E6D3),
            Color(0xFFD9B382),
            Color(0xFF5C3A21)
          ],
        ),
      ),
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Lottie.asset('assets/splash.json'),
                Text(
                  'Reserve Bite',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
