import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_first_project/core/logic/helper_methods.dart';
import 'package:flutter_first_project/views/login.dart';

import '../../core/design/app_image.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingView> {
  double sliderValue = 10;
  final list = [
    _Model(
        image: "amico.jpg",
        title: "Welcome to\nTECO App",
        desc:
        "Discover fresh, healthy meals delivered straight to your door."),
    _Model(
        image: "pana.jpg",
        title: "Quick Delivery",
        desc:
        "List your products, set prices, and start selling to your customers in just a few taps."),
    _Model(
        image: "jana.jpg",
        title: "Start Today!",
        desc:
        "Start your culinary journey with us today!."),
  ];
  int currentPage = 0;
  final pageControl = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: PageView.builder(
                  controller: pageControl,
                  itemCount: list.length,
                  onPageChanged: (value) {
                    currentPage = value;
                    setState(() {});
                  },
                  itemBuilder: (context, index) => AppImage(
                    list[index].image,
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  list.length,
                      (index) => Padding(
                    padding: EdgeInsetsDirectional.only(end: 4),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: currentPage == index
                          ? Theme.of(context).primaryColor
                          : Color(0xffD9D9D9),
                    ),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  list[currentPage].title,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  list[currentPage].desc,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff7E7E7E),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  if (currentPage != list.length - 1)
                    TextButton(
                      onPressed: () {
                        navigateTo(LoginView());
                      },
                      child: Text("Skip"),
                    ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if(currentPage==list.length-1)
                      {
                        navigateTo(LoginView());
                      }else {
                        pageControl.nextPage(
                          duration: Duration(microseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    },
                    child: AppImage("arrow_forword.png"),
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

class _Model {
  final String image, title, desc;

  _Model({required this.image, required this.title, required this.desc});
}