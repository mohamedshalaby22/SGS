import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/quiez_page.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/formfield.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:get/get.dart';

class CreateQuiez extends StatefulWidget {
  const CreateQuiez({Key? key}) : super(key: key);

  @override
  State<CreateQuiez> createState() => _CreateQuiezState();
}

int selectedValue = 0;
var question = TextEditingController();
var answer1 = TextEditingController();
var answer2 = TextEditingController();
var answer3 = TextEditingController();
var answer4 = TextEditingController();
var formKey = GlobalKey<FormState>();

class _CreateQuiezState extends State<CreateQuiez> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              Text1(
                text: 'Assignment Information',
                color: primaryColor,
                size: 20,
              ),
            ],
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text1(
                  text: 'Description',
                  size: 20,
                  color: primaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text1(
                  text: 'Notes Of The Description',
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text1(
                  text: 'Question Number',
                  size: 20,
                  color: primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text1(
                  text: '1',
                  size: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text1(
                  text: 'Total Degree',
                  size: 20,
                  color: primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text1(
                  text: '1',
                  size: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text1(text: 'Questions', size: 25, color: primaryColor),
                const SizedBox(
                  height: 20,
                ),
                Text1(
                  text: 'Enter the text of the question',
                  size: 17,
                ),
                const SizedBox(
                  height: 7,
                ),
                DefaultFormField(
                  controller: question,
                  hint: 'question',
                  onSave: () {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'question musn\'t be empty';
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
                  text: 'Enter the first answer',
                  size: 17,
                ),
                const SizedBox(
                  height: 7,
                ),
                DefaultFormField(
                  controller: answer1,
                  hint: 'First choice',
                  onSave: () {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'answer musn\'t be empty';
                    }
                    return null;
                  },
                  type: TextInputType.text,
                  icon: Icons.check_circle,
                ),
                const SizedBox(
                  height: defaultPading,
                ),
                Text1(
                  text: 'Enter the second answer',
                  size: 17,
                ),
                const SizedBox(
                  height: 7,
                ),
                DefaultFormField(
                  controller: answer2,
                  hint: 'second choice',
                  onSave: () {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'answer musn\'t be empty';
                    }
                    return null;
                  },
                  type: TextInputType.text,
                  icon: Icons.check_circle,
                ),
                const SizedBox(
                  height: defaultPading,
                ),
                Text1(
                  text: 'Enter the third answer',
                  size: 17,
                ),
                const SizedBox(
                  height: 7,
                ),
                DefaultFormField(
                  controller: answer3,
                  hint: 'third choice',
                  onSave: () {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'answer musn\'t be empty';
                    }
                    return null;
                  },
                  type: TextInputType.text,
                  icon: Icons.check_circle,
                ),
                const SizedBox(
                  height: defaultPading,
                ),
                Text1(
                  text: 'Enter the last answer',
                  size: 17,
                ),
                const SizedBox(
                  height: 7,
                ),
                DefaultFormField(
                  controller: answer4,
                  hint: 'last choice',
                  onSave: () {},
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'answer musn\'t be empty';
                    }
                    return null;
                  },
                  type: TextInputType.text,
                  icon: Icons.check_circle,
                ),
                const SizedBox(
                  height: defaultPading,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text1(
                          text: 'Which one is the correct answer?',
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Transform.scale(
                        scale: 1.1,
                        child: RadioListTile(
                            value: 1,
                            title: Text1(
                              text: 'First Choice',
                              color: Colors.black,
                            ),
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = 1;
                              });
                            }),
                      ),
                      Transform.scale(
                        scale: 1.1,
                        child: RadioListTile(
                            value: 2,
                            title: Text1(
                              text: 'Second Choice',
                              color: Colors.black,
                            ),
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = 2;
                              });
                            }),
                      ),
                      Transform.scale(
                        scale: 1.1,
                        child: RadioListTile(
                            value: 3,
                            title: Text1(
                              text: 'Third Choice',
                              color: Colors.black,
                            ),
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = 3;
                              });
                            }),
                      ),
                      Transform.scale(
                        scale: 1.1,
                        child: RadioListTile(
                            value: 4,
                            title: Text1(
                              text: 'Fourth Choice',
                              color: Colors.black,
                            ),
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = 4;
                              });
                            }),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultButton(
                    text: 'Create',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.to(() => const QuiezPage(),
                            transition: Transition.leftToRight);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
