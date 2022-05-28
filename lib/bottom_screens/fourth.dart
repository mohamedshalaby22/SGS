// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/login.dart';
import 'package:flutter_application_3/Services/api.dart';
import 'package:flutter_application_3/Services/sharedprefrences.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  AuthController controller = Get.put(AuthController());

  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    controller.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return !controller.loggedUserIsNotNull
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
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
                              backgroundImage: controller
                                          .isProfilePickedPath.value ==
                                      true
                                  ? FileImage(
                                      File(controller.profilePickedPath.value))
                                  : controller.userModel.value.photo != null
                                      ? NetworkImage(
                                              controller.userModel.value.photo!)
                                          as ImageProvider
                                      : const AssetImage('assets/p1.png'),
                            ),
                          ),
                          Positioned(
                            bottom: 5.0,
                            right: 15.0,
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
                          ),
                          if (controller.isProfilePickedPath.value ||
                              controller.userModel.value.photo != null)
                            Positioned(
                              bottom: 5.0,
                              left: 15.0,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.red.shade400,
                                child: IconButton(
                                    onPressed: onDeletePress,
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    )),
                              ),
                            )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: defaultPading,
                    ),
                    Text(
                      controller.userModel.value.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: defaultPading / 3),
                    Text(
                      controller.userModel.value.email!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87.withOpacity(0.7)),
                    ),
                    const SizedBox(height: defaultPading * 3),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPading * 2,
                          horizontal: defaultPading),
                      child: DefaultButton(
                          text: 'Save Changes', onPressed: onSavedPress),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultPading),
                      child: DefaultButton(
                          text: 'LOG OUT',
                          onPressed: () async {
                            await SharedPrefrencesStorage.logOut();
                            Get.offAll(() => const SignIn());
                          }),
                    ),
                  ],
                ),
              ),
            );
    });
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

  Future onSavedPress() async {
    if (controller.profilePickedPath.value.isNotEmpty) {
      final result =
          await Api.uploadStudentPhoto(pickedFile!, showLoading: true);
      if (result.isNotEmpty) {
        controller.emptyProfilePickedPath();
        controller.getUser();
      }
    } else {
      AuthController().snackBar(context, 'Already up to date');
    }
  }

  Future onDeletePress() async {
    if (controller.isProfilePickedPath.value) {
      controller.emptyProfilePickedPath();
    } else {
      final result = await Api.deleteProfileImage(showLoading: true);
      if (result.isNotEmpty) {
        controller.getUser();
        controller.emptyProfilePickedPath();
      }
    }
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
