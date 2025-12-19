import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/generated/assets.dart';
import 'package:travel/views/booking_screen.dart';
import 'package:travel/views/home_screen.dart';
import 'package:travel/views/profile_screen.dart';
import 'package:travel/widgets/custom_nav.dart';
import '../bloc/bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavItem>(
      builder: (context, currentNavItem) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: primaryColor,
            resizeToAvoidBottomInset: false,
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: currentNavItem == NavItem.book
                    ? DecorationImage(
                        image: AssetImage(Assets.imagesBg2),
                        fit: BoxFit.cover,
                      )
                    : null,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xffaad09d), Color(0xff050d50).withAlpha(250)],
                ),
              ),
              child: Column(
                children: [
                  Expanded(child: _getPageContent(context, currentNavItem)),
                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                      left: 8,
                      bottom: 8,
                      top: 2,
                    ),
                    child: CustomNavigationBar(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getPageContent(BuildContext context, NavItem navItem) {
    switch (navItem) {
      case NavItem.home:
        return HomeScreen();
      case NavItem.profile:
        return ProfileScreen();
      case NavItem.book:
        return BookingScreen();
      case NavItem.reviews:
        return const Center(
          child: Text(
            'Reviews Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
    }
  }
}

/*                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        Text(
                          _getAppBarTitle(currentNavItem),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cairo',
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(Icons.menu),
                          ),
                        ),
                      ],
                    ),
                  ),
*/
