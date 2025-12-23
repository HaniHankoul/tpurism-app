import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel/models/attraction_model.dart';
import 'package:travel/services/attraction_repo.dart';
import 'package:travel/views/home_screen.dart';
import '../generated/assets.dart';

class AttractionsScreen extends StatefulWidget {
  const AttractionsScreen({super.key});

  @override
  State<AttractionsScreen> createState() => _AttractionsScreenState();
}

AttractionModel? attractionModel;

final AttractionsRepository _attractionsRepository = AttractionsRepository();

List<AttractionModel> _list = [];
List<bool> isOpen = List.generate(_list.length, (index) => false);

class _AttractionsScreenState extends State<AttractionsScreen> {
  void fetchAttractions() async {
    final attractions = await _attractionsRepository.getAllAttractions();
    _list = attractions;
    setState(() {
    });
  }

  @override
  void initState() {
    fetchAttractions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Attractions ',
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
          child: Column(
            children: [
              SizedBox(height: 12,),
              SizedBox(
                width: 300,
                child: TextFormField(
                  cursorColor: Color(0xffaad09d),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "search for attractions ..",
                    hintStyle: TextStyle(color: Colors.white),
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
              SizedBox(height: 8),
              _list.isEmpty
                  ? Expanded(
                    child: SizedBox(width: double.infinity,
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
                    ),
                  )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 30,
                            ),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              padding: EdgeInsets.all(12),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                      child: Center(child: Text('image')),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    _list[index].attractionName,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: 'cairo',
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(_list[index].description),
                                  SizedBox(height: 4),
                                  if (isOpen[index])
                                    Center(
                                      child: Container(
                                        width: 300,
                                        height: 170,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                        ),
                                        child: Center(
                                          child: Text(_list[index].location),
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 4),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isOpen[index] = !isOpen[index];
                                      });
                                    },
                                    icon: Icon(
                                      CupertinoIcons
                                          .arrow_up_left_arrow_down_right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
