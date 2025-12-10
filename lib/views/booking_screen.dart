import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/views/home_screen.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: primaryColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Booking',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'bitcount',
                      fontSize: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        color: Color(0xff050d50),
                        CupertinoIcons.plus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(height: 200,width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            boxShadow: [BoxShadow(color: Colors.black.withAlpha(100),blurRadius: 1, spreadRadius: 1)]
            ),

            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.question_circle,color: primaryColor,size: 60,),
                SizedBox(height: 12,),
                Center(child: Text(textAlign:TextAlign.center ,'No Bookings been added recently ')),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
