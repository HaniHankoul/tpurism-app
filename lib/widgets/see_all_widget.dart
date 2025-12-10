import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/common_trips.dart';
import '../views/home_screen.dart';

class SeeAllWidget extends StatefulWidget {
  const SeeAllWidget({super.key});

  @override
  State<SeeAllWidget> createState() => _SeeAllWidgetState();
}

class _SeeAllWidgetState extends State<SeeAllWidget> {
  List<bool> isHearted = List.generate(20, (index) => false);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      body: ListView.builder(
        itemCount: 10,padding: EdgeInsets.zero,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                width: screenWidth * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommonTrips()),
                    );
                  },
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Trip Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    'Rating :  \t Visits: ',
                    style: TextStyle(
                      color: seconderyColor,
                      fontFamily: 'cairo',
                      fontSize: 13,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {setState(() {
                      isHearted[index]=!isHearted[index];
                    });},
                    icon: Icon(
                      size: 25,
                      isHearted[index]?CupertinoIcons.heart_fill:CupertinoIcons.heart,
                      color: seconderyColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
