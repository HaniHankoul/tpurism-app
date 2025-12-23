import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel/services/trip_repo.dart';
import 'package:travel/views/attractions_screen.dart';
import 'package:travel/views/common_trips.dart';
import 'package:travel/views/offers_screen.dart';
import 'package:travel/widgets/see_all_widget.dart';
import '../generated/assets.dart';
import '../models/trip_model.dart';
import 'notify_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TripModel? tripModel;
final TripRepository _tripRepository = TripRepository();
List<TripModel> _tripModel = [];
bool isSelected = true;
bool isFiltered = false;
bool isTrips = true;
bool isAttractions = true;
bool isActivities = true;
final primaryColor = Color(0xff282b62);
final seconderyColor = Color(0xffaad09d);

class _HomeScreenState extends State<HomeScreen> {
  void fetchTrip() async {
    final trip = await _tripRepository.getAllTrips();
    setState(() {
      _tripModel = trip;
      print('object');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchTrip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'bitcount',
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotifyScreen()),
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(color: Color(0xff050d50), CupertinoIcons.bell),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isFiltered = !isFiltered;
                  });
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    color: Color(0xff050d50),
                    Icons.settings_outlined,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.75,
                child: TextFormField(
                  cursorColor: Color(0xffaad09d),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "search for trips , attractions ..",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Color(0xffaad09d),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xffaad09d),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xffaad09d),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xffaad09d),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: isFiltered ? 180 : 0,
            width: screenWidth * 0.6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(100),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trips',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                        ),

                        Checkbox(
                          activeColor: primaryColor,
                          hoverColor: primaryColor,
                          value: isTrips,
                          onChanged: (val) {
                            setState(() {
                              isTrips = !isTrips;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Attractions',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                        ),
                        Checkbox(
                          activeColor: primaryColor,
                          hoverColor: primaryColor,
                          value: isAttractions,
                          onChanged: (val) {
                            setState(() {
                              isAttractions = !isAttractions;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Activities',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'cairo',
                            fontSize: 20,
                          ),
                        ),
                        Checkbox(
                          activeColor: primaryColor,
                          hoverColor: primaryColor,
                          value: isActivities,
                          onChanged: (val) {
                            setState(() {
                              isActivities = !isActivities;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // if (isFiltered)
          //   Padding(
          //     padding: const EdgeInsets.only(left: 8, top: 8),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           width: screenWidth * 0.6,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(14),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black.withAlpha(100),
          //                 spreadRadius: 1,
          //                 blurRadius: 5,
          //               ),
          //             ],
          //           ),
          //           child: Column(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                   horizontal: 12,
          //                   vertical: 4,
          //                 ),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'Trips',
          //                       style: TextStyle(
          //                         color: primaryColor,
          //                         fontWeight: FontWeight.w600,
          //                         fontFamily: 'cairo',
          //                         fontSize: 20,
          //                       ),
          //                     ),
          //
          //                     Checkbox(
          //                       activeColor: primaryColor,
          //                       hoverColor: primaryColor,
          //                       value: isTrips,
          //                       onChanged: (val) {
          //                         setState(() {
          //                           isTrips = !isTrips;
          //                         });
          //                       },
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                   horizontal: 12,
          //                   vertical: 4,
          //                 ),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'Attractions',
          //                       style: TextStyle(
          //                         color: primaryColor,
          //                         fontWeight: FontWeight.w600,
          //                         fontFamily: 'cairo',
          //                         fontSize: 20,
          //                       ),
          //                     ),
          //                     Checkbox(
          //                       activeColor: primaryColor,
          //                       hoverColor: primaryColor,
          //                       value: isAttractions,
          //                       onChanged: (val) {
          //                         setState(() {
          //                           isAttractions = !isAttractions;
          //                         });
          //                       },
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(
          //                   horizontal: 12,
          //                   vertical: 4,
          //                 ),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       'Activities',
          //                       style: TextStyle(
          //                         color: primaryColor,
          //                         fontWeight: FontWeight.w600,
          //                         fontFamily: 'cairo',
          //                         fontSize: 20,
          //                       ),
          //                     ),
          //                     Checkbox(
          //                       activeColor: primaryColor,
          //                       hoverColor: primaryColor,
          //                       value: isActivities,
          //                       onChanged: (val) {
          //                         setState(() {
          //                           isActivities = !isActivities;
          //                         });
          //                       },
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         SizedBox(width: 6),
          //         Container(
          //           width: screenWidth * 0.3,
          //           height: 170,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(14),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.black.withAlpha(100),
          //                 spreadRadius: 1,
          //                 blurRadius: 5,
          //               ),
          //             ],
          //           ),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               Container(
          //                 height: 50,
          //                 width: 80,
          //                 decoration: BoxDecoration(
          //                   border: Border.all(color: seconderyColor, width: 2),
          //                   borderRadius: BorderRadius.circular(12),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: Colors.black.withAlpha(100),
          //                       blurRadius: 1,
          //                     ),
          //                   ],
          //                   color: Colors.white,
          //                 ),
          //                 child: Center(
          //                   child: Text(
          //                     'settings',
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.w400,
          //                       color: seconderyColor,
          //                       fontFamily: 'cairo',
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 height: 50,
          //                 width: 80,
          //                 decoration: BoxDecoration(
          //                   border: Border.all(color: seconderyColor, width: 2),
          //                   borderRadius: BorderRadius.circular(12),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: Colors.black.withAlpha(100),
          //                       blurRadius: 1,
          //                     ),
          //                   ],
          //                   color: Colors.white,
          //                 ),
          //                 child: Center(
          //                   child: Text(
          //                     'about',
          //                     style: TextStyle(
          //                       fontWeight: FontWeight.w400,
          //                       color: seconderyColor,
          //                       fontFamily: 'cairo',
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Common trips',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              fontFamily: 'cairo',
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SeeAllWidget(),
                                ),
                              );
                            },
                            child: Text(
                              'See all',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'cairo',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    _tripModel.isEmpty?SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Lottie.asset(Assets.imagesLoading),
                          ),

                        ],
                      ),
                    ):
                    CarouselSlider(
                      options: CarouselOptions(autoPlay: true, height: 220),
                      items: _tripModel.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CommonTrips(id: i.tripId),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 180,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$i',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Row(children: [Text(i.title)]),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AttractionsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 90,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.imagesAttratction2),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 5),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            textAlign: TextAlign.left,
                            'Attractions',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OffersScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 90,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.imagesAttraction1),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 5),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            textAlign: TextAlign.left,
                            'Offers',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'cairo',
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 90,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.imagesActitvity2),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 5),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            textAlign: TextAlign.left,
                            'Activities',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
