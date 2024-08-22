import 'package:flutter/material.dart';
import 'package:flutter_first_project/core/logic/helper_methods.dart';

import 'views/add_product.dart';
import 'views/home.dart';
import 'views/login.dart';
import 'views/on_boarding.dart';

import 'views/register.dart';
import 'views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const primaryColor = Color(0xffFCB836);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorkey,
        theme: ThemeData(
          secondaryHeaderColor: Color(0xff7E7E7E),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffD9D9D9)))),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: MaterialColor(primaryColor.value, {
            50: primaryColor.withOpacity(.05),
            100: primaryColor.withOpacity(.1),
            200: primaryColor.withOpacity(.2),
            300: primaryColor.withOpacity(.3),
            400: primaryColor.withOpacity(.4),
            500: primaryColor.withOpacity(.5),
            600: primaryColor.withOpacity(.6),
            700: primaryColor.withOpacity(.7),
            800: primaryColor.withOpacity(.8),
            900: primaryColor.withOpacity(.9),
          })),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: primaryColor),
        ),
        home: SplashView());
  }
}
