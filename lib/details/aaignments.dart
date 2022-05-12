// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/formfield.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/assiements_view.dart';
import 'package:get/get.dart';

class Assignments extends StatelessWidget {
  Assignments({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  var id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPading, vertical: defaultPading * 4),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: primaryColor,
                      size: 30,
                    ),
                    const SizedBox(
                      width: defaultPading / 2,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text1(
                              text:
                                  'To Get the Assignment You Must Enter Your Id Number',
                              size: 16,
                              color: Colors.grey.shade600),
                          const SizedBox(
                            height: defaultPading / 2,
                          ),
                          Text1(
                              text: 'You Will Find It In Your Profile Page',
                              size: 16,
                              color: primaryColor),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: defaultPading * 3,
                ),
                Container(
                  padding: const EdgeInsets.all(defaultPading),
                  decoration: decoration,
                  child: Column(
                    children: [
                      Text1(text: 'Enter Your ID '),
                      const SizedBox(
                        height: 7,
                      ),
                      DefaultFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'ID musn\'t be empty';
                          } else if (value.length < 15) {
                            return 'ID must be 14 num';
                          }
                          return null;
                        },
                        type: TextInputType.phone,
                        hint: 'enter your id',
                        controller: id,
                        icon: Icons.lock,
                        onSave: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultPading * 2,
                ),
                DefaultButton(
                    text: 'View Assignment',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.offAll(() => const AssignmentsPage(),
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
