import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/login.dart';
import 'package:flutter_application_3/Screens/on_borading_screen.dart';
import 'package:flutter_application_3/Services/sharedprefrences.dart';
import 'package:flutter_application_3/bottom_screens/home_layout.dart';
import 'package:flutter_application_3/main.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getDataAndRoute();
    super.initState();
  }

  getDataAndRoute() {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      timer.cancel();
      if (isFirst) {
        return Get.offAll(() => const OnBoardingScrean());
      }
      final result = await SharedPrefrencesStorage.getSavedUser();
      if (result == null) {
        return Get.offAll(() => SignIn());
      }
      return Get.offAll(() => const HomeLayOut());
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: TweenAnimationBuilder(
                  curve: Curves.bounceOut,
                  tween: Tween<double>(
                    begin: 60,
                    end: size.width * 0.60,
                  ),
                  duration: const Duration(seconds: 2),
                  builder: (
                    BuildContext context,
                    dynamic value,
                    child,
                  ) {
                    return Container(
                        width: value,
                        height: value,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset('assets/s.jpeg'));
                  })),
        ],
      ),
    );
  }
}
/*

*/