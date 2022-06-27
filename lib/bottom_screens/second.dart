// ignore_for_file: avoid_unnecessary_containers
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/quiez_page.dart';
import 'package:flutter_application_3/Screens/student_assignment.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/main.dart';
import 'package:get/get.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isDoctor
          ? FloatingActionButton(
              onPressed: () {
                Get.to(() => const QuiezPage(), transition: Transition.zoom);
              },
              child: const Icon(Icons.drive_file_rename_outline))
          : null,
      appBar: AppBar(
        centerTitle: true,
        title: Text1(
          text: 'Assignments',
          color: primaryColor,
          size: 25,
        ),
      ),
      body: isDoctor
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => GestureDetector(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: Text1(
                                    text: 'Do You Want delete this Assingment',
                                    color: Colors.grey.shade700,
                                  ),
                                  actions: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text1(
                                            text: 'Delete Assingment',
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(defaultPading),
                        padding: const EdgeInsets.all(defaultPading),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade50,
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular((10))),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        'https://img.freepik.com/free-vector/add-tasks-concept-illustration_114360-4885.jpg?t=st=1653736774~exp=1653737374~hmac=c6068fd8cdb3a78c7397c4737e0f483c938056505e4b4c12f5ef2839867af785&w=826'),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text1(
                                  text: 'Assignment',
                                  size: 18,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DefaultButton(
                                text: 'Open Asignment',
                                onPressed: () {
                                  Get.to(() => const QuiezPage(),
                                      transition: Transition.leftToRight);
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff88cdf6),
                                        Color(0xff6a9cfd)
                                      ])),
                              child: RadioListTile(
                                  activeColor: Colors.red,
                                  title: Text1(
                                    text: 'Show to  Students',
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  value: 1,
                                  groupValue: selected,
                                  onChanged: (value) {
                                    setState(() {
                                      selected = 1;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const StudentAssignment(),
    );
  }
}
