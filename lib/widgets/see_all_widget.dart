import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';
import '../models/trip_model.dart';
import '../services/trip_repo.dart';
import '../views/common_trips.dart';
import '../views/home_screen.dart';

class SeeAllWidget extends StatefulWidget {
  const SeeAllWidget({super.key});

  @override
  State<SeeAllWidget> createState() => _SeeAllWidgetState();
}

class _SeeAllWidgetState extends State<SeeAllWidget> {
  final TripRepository _tripRepository = TripRepository();
  List<TripModel> _tripModel = [];

  void fetchTrip() async {
    final trip = await _tripRepository.getAllTrips();
    setState(() {
      _tripModel = trip;
    });
  }

  @override
  void initState() {
    fetchTrip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('All Trips', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor, seconderyColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.decal,
            ),
          ),
          child: Column(
            children: [
              _tripModel.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Lottie.asset(Assets.imagesLoading),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Loading ...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'cairo',
                          ),
                        ),
                      ],
                    )
                  : Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
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
                                      MaterialPageRoute(
                                        builder: (context) => CommonTrips(id: _tripModel[index].tripId,),
                                      ),
                                    );
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    _tripModel[index].title,
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
                                ),
                              ),
                            ),
                          ],
                        ),
                        itemCount: _tripModel.length,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
