// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/formfield.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddSubject extends StatelessWidget {
  AddSubject({Key? key}) : super(key: key);
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  AuthController controller = Get.put(AuthController());
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var mid = TextEditingController();
  var oral = TextEditingController();
  var practical = TextEditingController();
  var totalDg = TextEditingController();
  var hours = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
                top: defaultPading * 2,
                left: defaultPading,
                right: defaultPading),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add New Subject',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.add,
                            color: primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: defaultPading,
                            right: defaultPading,
                            bottom: defaultPading),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Text1(
                    text: 'Upload Subject_Image',
                    size: 20,
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  GestureDetector(
                    onTap: () {
                      takePhoto(ImageSource.gallery);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(defaultPading),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(
                            width: defaultPading / 2,
                          ),
                          Text1(
                            text: 'Subject Image',
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  Text1(
                    text: 'Subject_Name',
                    size: 17,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  DefaultFormField(
                    controller: name,
                    hint: 'Networks',
                    onSave: () {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Name musn\'t be empty';
                      }
                      return null;
                    },
                    type: TextInputType.text,
                    icon: Icons.sort,
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  Text1(
                    text: 'Midterm_Degree',
                    size: 17,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  DefaultFormField(
                    controller: mid,
                    hint: '20',
                    onSave: () {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Degree musn\'t be empty';
                      }
                      return null;
                    },
                    type: TextInputType.number,
                    icon: Icons.check_circle,
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  Text1(
                    text: 'Oral_Degree',
                    size: 17,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  DefaultFormField(
                    controller: oral,
                    hint: '20',
                    onSave: () {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Degree musn\'t be empty';
                      }
                      return null;
                    },
                    type: TextInputType.number,
                    icon: Icons.check_circle,
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  Text1(
                    text: 'Practical_Degree',
                    size: 17,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  DefaultFormField(
                    controller: practical,
                    hint: '20',
                    onSave: () {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Degree musn\'t be empty';
                      }
                      return null;
                    },
                    type: TextInputType.number,
                    icon: Icons.check_circle,
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  Text1(
                    text: 'Final_Degree',
                    size: 17,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  DefaultFormField(
                    controller: totalDg,
                    hint: '90',
                    onSave: () {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Degree musn\'t be empty';
                      }
                      return null;
                    },
                    type: TextInputType.number,
                    icon: Icons.check_circle,
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  Text1(
                    text: 'Total_Hours',
                    size: 17,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  DefaultFormField(
                    controller: hours,
                    hint: '3',
                    onSave: () {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Degree musn\'t be empty';
                      }
                      return null;
                    },
                    type: TextInputType.number,
                    icon: Icons.check_circle,
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  Text1(
                    text: 'Select level Academy',
                    size: 17,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  DropdownButtonFormField<String>(
                    hint: const Text(
                      'First level',
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    value: controller.selectedItem,
                    items: controller.items
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )))
                        .toList(),
                    onChanged: (item) {
                      controller.ChangeSelected(item!);
                    },
                  ),
                  const SizedBox(
                    height: defaultPading,
                  ),
                  Text1(
                    text: 'Select_Department',
                    size: 17,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  DropdownButtonFormField<String>(
                    hint: const Text(
                      'Computer System (Cs)',
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    value: controller.selectedItem,
                    items: controller.items2
                        .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )))
                        .toList(),
                    onChanged: (item) {
                      controller.ChangeSelected(item!);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(defaultPading),
        child: DefaultButton(
            text: 'Add Subject',
            onPressed: () {
              if (formKey.currentState!.validate()) {}
            }),
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
