// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/components/text2.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/degrees.dart';
import 'package:get/get.dart';

class Attachments extends StatelessWidget {
  const Attachments({Key? key}) : super(key: key);

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
                image: 'assets/videos.png',
                text: 'Videos lecture',
                onPressed: () {},
              ),
              ContainerData(
                image: 'assets/grades.jpg',
                text: 'Subjects Degress',
                onPressed: () {
                  Get.to(() => const DegressPage(),
                      transition: Transition.leftToRight);
                },
              ),
              ContainerData(
                image: 'assets/files.png',
                text: 'lecture Files',
                onPressed: () {},
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
            Image.asset(
              image,
              width: 150,
              height: 150,
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
