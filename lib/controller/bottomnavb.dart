import 'package:flutter/material.dart';
import 'package:flutter_application_3/bottom_screens/groups.dart';
import 'package:flutter_application_3/bottom_screens/profile.dart';
import 'package:flutter_application_3/bottom_screens/subjects.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetxController {
  List<Widget> screens = [
    const FirstScreen(),
    // const SecondScreen(),
    const Groups(),
    const FourthScreen(),
  ];
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_work_outlined), label: 'Home'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.school_outlined), label: 'Quizzes'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.maps_ugc_outlined), label: 'Chats'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined), label: 'Profile'),
  ];

  int currentIndex = 0;
  chanagecurrentIndex(index) {
    currentIndex = index;
    update();
  }

//on Borading Screen
  var isSelected = 0.obs;
  changeIsSelected(value) {
    isSelected.value = value;
  }
}
