import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel/models/offer_model.dart';
import 'package:travel/services/offer_repo.dart';
import 'package:travel/views/common_trips.dart';
import 'package:travel/views/home_screen.dart';

import '../generated/assets.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

OfferModel? offerModel;
final OfferRepository _offerRepository = OfferRepository();
List<OfferModel> _list = [];

class _OffersScreenState extends State<OffersScreen> {
  void fetchOffer() async {
    final offer = await _offerRepository.getAllOffers();
    _list = offer;
    setState(() {});
  }

  @override
  void initState() {
    fetchOffer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Offers',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'cairo',
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: _list.isEmpty
            ? SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        color: primaryColor,
                        fontSize: 22,
                        fontFamily: 'cairo',
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: index % 2 == 0
                                  ? primaryColor
                                  : seconderyColor,
                              boxShadow: [
                                BoxShadow(color: Colors.black45, blurRadius: 2),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                index % 2 == 0
                                    ? SizedBox(
                                        child: Image(
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          height: 150,
                                          image: AssetImage(Assets.imagesSale1),
                                        ),
                                      )
                                    : SizedBox(
                                        child: Image(
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                          height: 150,
                                          image: AssetImage(Assets.imagesSale2),
                                        ),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _list[index].title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _list[index].description,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'All Are Up To :${_list[index].discountValue.toString()} %',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'cairo',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => CommonTrips(id: _list[index].tripId),));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Center(child: Text('Check')),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
