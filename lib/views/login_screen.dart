import 'package:flutter/material.dart';
import 'package:travel/views/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
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
            Text('Logo', style: TextStyle(fontSize: 30, color: Colors.white)),
            SizedBox(height: 16),
            Container(
              height: screenHeight * 0.35,
              width: screenWidth * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Colors.black.withAlpha(100)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 230,
                    child: TextFormField(
                      cursorColor: Colors.black.withAlpha(100),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.black.withAlpha(80),
                        ),
                        suffixIcon: Icon(
                          size: 30,
                          Icons.person,
                          color: Color(0xffaad09d),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xffaad09d),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xffaad09d),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xff282b62),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 230,
                    child: TextFormField(
                      cursorColor: Colors.black.withAlpha(100),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.black.withAlpha(80),
                        ),
                        suffixIcon: Icon(
                          size: 30,
                          Icons.lock,
                          color: Color(0xffaad09d),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xffaad09d),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xffaad09d),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xff282b62),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 125,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffaad09d),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black.withAlpha(50),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: 'cairo',

                              color: Color(0xff282b62),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 110,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff282b62),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
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
                                fontFamily: 'cairo',
                                color: Color(0xff282b62),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
