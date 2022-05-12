// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/add_subject.dart';
import 'package:flutter_application_3/components/text2.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/detail1.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Data {
  String subjects;
  String doctorName;
  String image;
  Data({
    required this.subjects,
    required this.image,
    required this.doctorName,
  });
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<Data> items = [
    Data(
        subjects: 'Computer Graphics',
        image:
            'https://images.unsplash.com/photo-1606166325683-e6deb697d301?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1485&q=80',
        doctorName: 'Marawa Kashaba'),
    Data(
        subjects: 'Wireless and\nMobile NetWorks',
        image:
            'https://images.unsplash.com/photo-1597733336794-12d05021d510?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
        doctorName: 'Ehab Rushdy'),
    Data(
        subjects: 'Virtual Reality',
        image:
            'https://images.unsplash.com/photo-1563372590-aa093423dcbe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1622&q=80',
        doctorName: 'Osama ElKomy'),
    Data(
        subjects: 'Selected Topics',
        image:
            'https://images.unsplash.com/photo-1607252650355-f7fd0460ccdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        doctorName: 'Walled Kheder '),
    Data(
        subjects: 'Computer Animation',
        image:
            'https://images.unsplash.com/photo-1625014618427-fbc980b974f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80',
        doctorName: 'Hanna Hamaza '),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddSubject(), transition: Transition.zoom);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'SGS',
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
              child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: defaultPading,
                      crossAxisSpacing: defaultPading),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        deafultDialog(context);
                      },
                      onTap: () {
                        Get.to(() => Detail1(items[index]),
                            transition: Transition.leftToRight);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade50,
                            border: Border.all(
                                width: 1, color: Colors.grey.shade200),
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
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)),
                              ),
                              child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
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
                              child: Text(
                                items[index].subjects,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> deafultDialog(BuildContext context) {
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
              onPressed: () => Navigator.pop(context, 'Delete Subject'),
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
