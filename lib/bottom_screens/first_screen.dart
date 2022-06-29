// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/add_subject.dart';
import 'package:flutter_application_3/Services/api.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/components/text2.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/detail1.dart';
import 'package:flutter_application_3/main.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Data {
  String subjects;
  String doctorName;
  String image;
  int id;
  Data({
    required this.subjects,
    required this.image,
    required this.id,
    required this.doctorName,
  });
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final img =
      'https://images.unsplash.com/photo-1606166325683-e6deb697d301?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1485&q=80';
  Future<void> handel() async {
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isDoctor
          ? FloatingActionButton(
              onPressed: () {
                Get.to(() => AddSubject(), transition: Transition.zoom)!
                    .then((value) => setState(() {}));
              },
              child: const Icon(Icons.add),
            )
          : null,
      appBar: AppBar(
        title: Text(
          'SG System',
          style: TextStyle(
              color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  color: Colors.white,
                  iconSize: 25,
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: primaryColor,
                  )),
              const Positioned(
                right: 7,
                top: 6,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.pink,
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: defaultPading, left: defaultPading, right: defaultPading),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text2(
              text: 'Subjects of The Year',
            ),
            const SizedBox(
              height: defaultPading * 2,
            ),
            Expanded(
                child: FutureBuilder<List>(
                    future: Api.getHome(),
                    builder: (_, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData && snapshot.data!.isEmpty) {
                        return Center(
                            child: Column(
                          children: [
                            Image.asset('assets/no data.gif'),
                            Text1(
                              text: 'No subjects found',
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ));
                      }
                      final items = snapshot.data!
                          .map((e) => Data(
                                id: e['id'],
                                doctorName: '',
                                image: img,
                                subjects: e["subject_name"] ?? "",
                              ))
                          .toList();
                      return LiquidPullToRefresh(
                        height: 210,
                        backgroundColor: Colors.lightBlue,
                        color: Colors.white,
                        animSpeedFactor: 2,
                        showChildOpacityTransition: false,
                        onRefresh: handel,
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: items.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: defaultPading,
                                    crossAxisSpacing: defaultPading),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onLongPress: () {
                                  deafultDialog(context, items[index].id);
                                },
                                onTap: () {
                                  Get.to(() => Detail1(items[index]),
                                      transition: Transition.leftToRight);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.shade50,
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.shade200),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blue.shade50,
                                            offset: const Offset(4, 4),
                                            blurRadius: 15,
                                            spreadRadius: 1),
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 90,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(10)),
                                        ),
                                        child: Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: const BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(10)),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: items[index].image,
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: defaultPading,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7, right: 7, bottom: 7),
                                          child: Text(
                                            items[index].subjects,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    })),
          ],
        ),
      ),
    );
  }

  Future<dynamic> deafultDialog(BuildContext context, id) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          actions: [
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () async {
                Get.back();
                await Api.deleteSubject(id.toString(), showLoading: true);
              },
              child: const Text(
                'Delete Subject',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Delete Subject',
              ),
              Icon(
                Icons.delete_forever_rounded,
                color: Colors.grey,
              ),
            ],
          ),
          content: Text(
              'Are you sure that you would like to Delete Subject? You will lose this Subject',
              style: TextStyle(
                color: Colors.grey.shade600,
              ))),
    );
  }
}
