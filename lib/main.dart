import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/bloc/bloc.dart';
import 'package:travel/views/home_screen.dart';
import 'package:travel/views/splash_screen.dart';

void main(){runApp(MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: true,
        statusBarColor: primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocProvider(
        create: (context) => NavigationCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Main(),
        ),
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }
}

