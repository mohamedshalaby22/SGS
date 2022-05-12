// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/login.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/components/text2.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  String username = '';

  AuthController controller = Get.put(AuthController());

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();
  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('name')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 85,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: controller.isProfilePickedPath.value ==
                                true
                            ? FileImage(
                                    File(controller.profilePickedPath.value))
                                as ImageProvider
                            : const AssetImage('assets/p1.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 5.0,
                      right: 30.0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue.shade100,
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25))),
                                  context: (context),
                                  builder: (context) =>
                                      ModelSheetPicker(context));
                            },
                            icon: const Icon(
                              Icons.add_a_photo_rounded,
                              color: Colors.black,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPading,
              ),
              Text2(text: username),
              const SizedBox(
                height: defaultPading * 3,
              ),
              DefaultPersonal(
                title: 'Faculty :',
                text: 'Copmuter Information',
              ),
              DefaultPersonal(
                title: 'Student id :',
                text: '0411281456',
              ),
              DefaultPersonal(
                title: 'Valid until :',
                text: '30/6/2022',
              ),
              DefaultPersonal(
                title: 'Team :',
                text: '4',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPading),
                child: Divider(
                  color: Color(0xffe0e0e0),
                  thickness: 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPading * 3, horizontal: defaultPading),
                child: DefaultButton(
                    text: 'LOG OUT',
                    onPressed: () {
                      // _auth.signOut();
                      Get.offAll(SignIn());
                    }),
              ),
              const SizedBox(
                height: defaultPading,
              ),
            ],
          ),
        );
      }),
    );
  }

  ModelSheetPicker(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: defaultPading),
      height: size.height * 0.2,
      width: size.width,
      child: Column(
        children: [
          Text1(
            text: 'Choose Profile Photo',
            size: 15,
            color: Colors.black,
          ),
          const SizedBox(
            height: defaultPading,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.image,
                      color: primaryColor,
                    ),
                    const SizedBox(
                      height: defaultPading / 2,
                    ),
                    Text1(
                      text: 'Gallery',
                      color: Colors.black,
                      size: 15,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.camera,
                      color: primaryColor,
                    ),
                    const SizedBox(
                      height: defaultPading / 2,
                    ),
                    Text1(
                      text: 'Camera',
                      color: Colors.black,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    controller.pickedPath(pickedFile!.path);
    Get.back();
  }
}

class DefaultPersonal extends StatelessWidget {
  DefaultPersonal({
    Key? key,
    required this.text,
    required this.title,
  }) : super(key: key);
  String text;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: defaultPading, left: defaultPading, right: defaultPading),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text1(
            text: title,
            color: Colors.black,
            size: 20,
          ),
          Text1(
            text: text,
            color: primaryColor,
            size: 17,
          ),
        ],
      ),
    );
  }
}
