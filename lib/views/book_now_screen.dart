import 'package:flutter/material.dart';
import 'package:travel/views/booking_success_screen.dart';

import 'home_screen.dart';

class BookNowScreen extends StatelessWidget {
  const BookNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking ',
          style: TextStyle(
            fontFamily: 'cairo',
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, seconderyColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white.withAlpha(50),
                ),
                padding: EdgeInsets.all(14),
                child: Text(
                  'Booking Date : (actual date)',
                  style: TextStyle(
                    color: seconderyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black45,blurRadius: 1,spreadRadius: 1)]
                ),
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trip Name : ',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'cairo',
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    Text(
                      'Booking Cost : ',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'cairo',
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    Text(
                      'Status : ',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'cairo',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey, width: 2),
                  color: Colors.white.withAlpha(50),
                ),
                padding: EdgeInsets.all(14),
                child: Text(
                  'note that the booking\'s cost is separate from the actual trip\'s cost',
                  style: TextStyle(
                    color: Colors.white.withAlpha(150),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BookingSuccessScreen()),
                        (route) => (false),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  width:double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Proceed',
                      style: TextStyle(
                        color: seconderyColor,
                        fontSize: 26,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
