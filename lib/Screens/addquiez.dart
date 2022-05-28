// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/addquiezquest.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/formfield.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/auth.dart';
import 'package:get/get.dart';
import '../components/text1.dart';

class AddQuiezNotes extends StatelessWidget {
  AddQuiezNotes({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var notes = TextEditingController();
  var number = TextEditingController();
  var degree = TextEditingController();
  var hour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text1(
          text: 'Create Assignment +',
          color: primaryColor,
          size: 25,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(defaultPading),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text1(
                  text: 'Enter Notes',
                  size: 17,
                ),
                const SizedBox(
                  height: 7,
                ),
                DefaultFormField(
                  controller: notes,
                  maxLines: 3,
                  hint: 'Assignment Notes',
                  onSave: () {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Notes musn\'t be empty';
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
                  text: 'Question Number',
                  size: 17,
                ),
                const SizedBox(
                  height: 7,
                ),
                DefaultFormField(
                  controller: number,
                  hint: '0',
                  onSave: () {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Question Number musn\'t be empty';
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
                  text: 'Assignment degree',
                  size: 17,
                ),
                const SizedBox(
                  height: 7,
                ),
                DefaultFormField(
                  controller: degree,
                  hint: '0',
                  onSave: () {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Assignment degree musn\'t be empty';
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
                  text: 'Enter the Duration',
                  size: 17,
                ),
                const SizedBox(
                  height: 7,
                ),
                DropdownButtonFormField<String>(
                  hint: const Text(
                    'Hours',
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  value: controller.selectedItem,
                  items: controller.items3
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
                    controller.ChangeSelected3(item!);
                  },
                ),
                const SizedBox(
                  height: defaultPading,
                ),
                DefaultFormField(
                  controller: hour,
                  hint: '0',
                  onSave: () {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Duration musn\'t be empty';
                    }
                    return null;
                  },
                  type: TextInputType.number,
                  icon: Icons.check_circle,
                ),
                const SizedBox(
                  height: defaultPading,
                ),
                DefaultButton(
                    text: 'Create Assignment',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.to(() => const CreateQuiez(),
                            transition: Transition.leftToRight);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
