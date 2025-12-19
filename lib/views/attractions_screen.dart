import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/views/home_screen.dart';

class AttractionsScreen extends StatefulWidget {
  const AttractionsScreen({super.key});

  @override
  State<AttractionsScreen> createState() => _AttractionsScreenState();
}

List<bool> isOpen =List.generate(10,(index)=>false );

class _AttractionsScreenState extends State<AttractionsScreen> {
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
              SizedBox(
                width: 300,
                child: TextFormField(
                  cursorColor: Color(0xffaad09d),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "search for trips , attractions ..",
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
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 30,
                      ),
                      child: AnimatedContainer(duration: Duration(milliseconds: 200),
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
                                decoration: BoxDecoration(color: Colors.grey),
                                child: Center(child: Text('Image')),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Attraction name'),
                            SizedBox(height: 8),
                            Text('Description'),
                            SizedBox(height: 4),
                            if(isOpen[index]) Center(
                              child: Container(
                                width: 300,
                                height: 170,
                                decoration: BoxDecoration(color: Colors.grey),
                                child: Center(child: Text('location on map')),
                              ),
                            ),
                            SizedBox(height: 4,),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isOpen[index]=!isOpen[index];
                                });
                              },
                              icon: Icon(
                                CupertinoIcons.arrow_up_left_arrow_down_right,
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
