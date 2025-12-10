import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'bitcount',
                    fontSize: 30,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 50,
                    height: 50,
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
              ],
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white.withAlpha(70),
                    child: CircleAvatar(radius: 67),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 380,
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 20, color: Colors.black.withAlpha(100)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Row(
                              children: [
                                Text(
                                  'Your Name ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "cairo",
                                    fontSize: 20,
                                    color: Color(0xff282b62),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 130,
                                child: TextFormField(
                                  cursorColor: Colors.black.withAlpha(100),
                                  decoration: InputDecoration(
                                    labelText: "First",
                                    labelStyle: TextStyle(
                                      color: Colors.black.withAlpha(80),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Color(0xff282b62),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Color(0xff282b62),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 3,
                                        color: Color(0xffaad09d),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              SizedBox(
                                width: 130,
                                child: TextFormField(
                                  cursorColor: Colors.black.withAlpha(100),
                                  decoration: InputDecoration(
                                    labelText: "Last",
                                    labelStyle: TextStyle(
                                      color: Colors.black.withAlpha(80),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Color(0xff282b62),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Color(0xff282b62),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                          SizedBox(height: 6),
                          SizedBox(
                            width: 266,
                            child: TextFormField(
                              cursorColor: Colors.black.withAlpha(100),
                              decoration: InputDecoration(
                                labelText: "Phone (+963)",
                                labelStyle: TextStyle(
                                  color: Colors.black.withAlpha(80),
                                ),
                                suffixIcon: Icon(
                                  size: 25,
                                  Icons.phone,
                                  color: Color(0xff282b62),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff282b62),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff282b62),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffaad09d),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 6),
                          SizedBox(
                            width: 266,
                            child: TextFormField(
                              cursorColor: Colors.black.withAlpha(100),
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: Colors.black.withAlpha(80),
                                ),
                                suffixIcon: Icon(
                                  size: 25,
                                  Icons.email,
                                  color: Color(0xff282b62),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff282b62),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff282b62),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffaad09d),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 6),
                          SizedBox(
                            width: 266,
                            child: TextFormField(
                              cursorColor: Colors.black.withAlpha(100),
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.black.withAlpha(80),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    size: 25,
                                    CupertinoIcons.eye_slash_fill,
                                    color: Color(0xff282b62),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff282b62),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Color(0xff282b62),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffaad09d),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 6),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 125,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xff282b62),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.black.withAlpha(50),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'update',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Color(0xffaad09d),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
