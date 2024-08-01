import 'dart:async';
import 'package:bea_shop/core/const/app_routes.dart';
import 'package:bea_shop/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const/app_color.dart';

class MyCustomSplashScreen extends StatefulWidget {
  const MyCustomSplashScreen({super.key});

  @override
  MyCustomSplashScreenState createState() =>
      MyCustomSplashScreenState();
}

class MyCustomSplashScreenState extends State<MyCustomSplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 4), () {
      setState(() {
        Get.offAllNamed(AppRoutes.home);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedContainer(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.bounceOut,
              height: height / _fontSize * .5),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 2000),
            opacity: _textOpacity,
            child: Text('Bea Shop',
                style:
                    AppTextStyleData.googleSeaweedScript().copyWith(
                  color: AppColor.white,
                  fontSize: animation1.value * 2.7,
                )),
          ),
        ],
      ),
    );
  }
}
