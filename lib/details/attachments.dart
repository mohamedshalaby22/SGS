// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/components/text2.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/attendance.dart';
import 'package:flutter_application_3/details/degrees.dart';
import 'package:get/get.dart';

class Attachments extends StatelessWidget {
  const Attachments(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text2(text: 'Attachments :'),
              const SizedBox(
                height: defaultPading,
              ),
              ContainerData(
                image: 'assets/grades.jpg',
                text: 'Subjects Degress',
                onPressed: () {
                  Get.to(() => DegressPage(id),
                      transition: Transition.leftToRight);
                },
              ),
              ContainerData(
                image: 'assets/files.png',
                text: 'Attendance',
                onPressed: () {
                  Get.to(() => const AttendancePage(),
                      transition: Transition.leftToRight);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerData extends StatelessWidget {
  ContainerData({
    Key? key,
    required this.image,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  String image;
  String text;
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: defaultPading),
        padding: const EdgeInsets.all(defaultPading / 2),
        decoration: decoration,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.grey.shade100,
              child: Image.asset(
                image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: defaultPading / 2,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: defaultPading / 2,
            ),
            Text1(
              text: text,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
