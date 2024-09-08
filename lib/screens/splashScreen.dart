// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolioapp/screens/stopWatch.dart';
import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Get.offAll(const StopWatchScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/images/stopwatch.json',
              width: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              'STOP WATCH',
              style: appHeading(AppColor.headingColor, 50),
            ),
          ],
        ),
      ),
    );
  }
}
