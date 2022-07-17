// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/bottom_screens/subjects.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text2.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/attachments.dart';
import 'package:flutter_application_3/details/posts.dart';
import 'package:flutter_application_3/main.dart';
import 'package:get/get.dart';

class Detail1 extends StatelessWidget {
  final Data data;

  Detail1(this.data);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // AuthController controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(leading: const LeadingIcon()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Text2(
              text: data.subjects,
            ),
            const SizedBox(
              height: defaultPading,
            ),
            Container(
                width: width,
                padding: const EdgeInsets.all(defaultPading),
                decoration: decoration,
                child: Column(
                  children: [
                    Container(
                      height: 220,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: defaultPading * 3,
            ),
            Column(
              children: [
                DefaultCont(
                  iconData: Icons.post_add_outlined,
                  text: 'Posts',
                  onPressed: () {
                    Get.to(() => Posts(data.id.toString()),
                        transition: Transition.leftToRight);
                  },
                ),
                isDoctor
                    ? Container()
                    : DefaultCont(
                        iconData: Icons.menu_book_outlined,
                        text: 'Attachments',
                        onPressed: () {
                          Get.to(() => Attachments(data.id),
                              transition: Transition.leftToRight);
                        },
                      ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class DefaultCont extends StatelessWidget {
  DefaultCont({
    Key? key,
    required this.iconData,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  String text;
  IconData iconData;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: defaultPading),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(defaultPading / 1.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  secColor,
                  thiColor,
                ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Colors.white),
            const SizedBox(
              width: 5,
            ),
            Text(text,
                style: TextStyle(
                  color: wprimary,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
/*
 
*/