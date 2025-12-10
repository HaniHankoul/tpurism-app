import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel/generated/assets.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: Image(image: AssetImage(Assets.imagesLogo1)),
            ),
            SizedBox(height: 16),
            Lottie.asset(
              Assets.imagesLoading,
              height: 80,
              width: 80,
              fit: BoxFit.fill,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
