import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/check_connection.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/bottomnavb.dart';
import 'package:get/get.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder:
          (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
        if (snapshot.hasData && snapshot.data != ConnectivityResult.none) {
          return GetBuilder<BottomNavBar>(
            init: BottomNavBar(),
            builder: (value) => Scaffold(
              backgroundColor: Colors.white,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                selectedItemColor: primaryColor,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                elevation: 20,
                currentIndex: value.currentIndex,
                onTap: (index) => value.chanagecurrentIndex(index),
                items: value.bottomItem,
              ),
              body: value.screens[value.currentIndex],
            ),
          );
        } else {
          return const CheckConnection();
        }
      },
    );
  }
}
