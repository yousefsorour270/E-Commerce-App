import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/core/design/app_image.dart';
import 'package:flutter_first_project/core/logic/helper_methods.dart';
import 'package:flutter_first_project/views/on_boarding.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        navigateTo(OnBoardingView());
      },
    );

    return Scaffold(
        body: FadeInDownBig(
      duration: Duration(seconds: 3),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Swing(
              child: AppImage(
                "Vector.png",
                width: 161,
                height: 150,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
                child: Text(
              "TECO",
              style: TextStyle(fontSize: 32, fontFamily: "NewRocker"),
            )),
          ],
        ),
      ),
    ));
  }
}
