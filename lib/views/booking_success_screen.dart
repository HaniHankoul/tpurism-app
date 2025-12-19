import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../generated/assets.dart';
import 'home_screen.dart';
import 'main_screen.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              fit: StackFit.expand,
              children: [Lottie.asset(Assets.imagesConfetti)],
            ),
            Column(
              children: [
                Spacer(),
                Center(
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Lottie.asset(Assets.imagesChecked),
                  ),
                ),
                Text(
                  'Success !',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                    fontFamily: 'cairo',
                  ),
                ),
                Text(
                  'Have a nice Trip',
                  style: TextStyle(
                    fontFamily: 'cairo',
                    fontSize: 16,
                    color: seconderyColor,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                          (route) => (false),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: seconderyColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'Continue',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(color: Colors.white, Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
