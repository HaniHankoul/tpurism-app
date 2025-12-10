import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isOpend = false;
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xffaad09d), Color(0xff050d50).withAlpha(250)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                        obscureText: isEnabled ? false : true,
                        cursorColor: Colors.black.withAlpha(100),
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.black.withAlpha(80),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isEnabled = !isEnabled;
                                isOpend = !isOpend;
                              });
                            },
                            child: Icon(
                              size: 25,
                              isOpend
                                  ? CupertinoIcons.eye_fill
                                  : CupertinoIcons.eye_slash_fill,
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
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
                            'sign up',
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
    );
  }
}
