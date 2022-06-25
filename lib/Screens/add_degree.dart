import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/formfield.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';

class AddDegree extends StatefulWidget {
  const AddDegree({Key? key}) : super(key: key);

  @override
  State<AddDegree> createState() => _AddDegreeState();
}

class _AddDegreeState extends State<AddDegree> {
  TextEditingController mid = TextEditingController();
  TextEditingController oral = TextEditingController();
  TextEditingController practical = TextEditingController();
  var formKey = GlobalKey<FormState>();
  //  var totalDegree=
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIcon(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text1(
                    text: 'Students Degree',
                    color: primaryColor,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.school_outlined,
                    color: primaryColor,
                    size: 25,
                  )
                ],
              ),
              const SizedBox(
                height: defaultPading * 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text1(
                      text: 'Mid_term',
                      size: 17,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        controller: mid,
                        validator: (value) {},
                        type: TextInputType.phone,
                        icon: Icons.check_circle,
                        onSave: () {}),
                    const SizedBox(
                      height: 15,
                    ),
                    Text1(
                      text: 'Oral',
                      size: 17,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        controller: oral,
                        validator: (value) {},
                        type: TextInputType.phone,
                        icon: Icons.check_circle,
                        onSave: () {}),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text1(
                      text: 'Practical',
                      size: 17,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        controller: practical,
                        validator: (value) {},
                        type: TextInputType.phone,
                        icon: Icons.check_circle,
                        onSave: () {}),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text1(
                      text: 'Total',
                      size: 17,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      padding: const EdgeInsets.all(18),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: aprimary),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.shade50),
                      child: Center(
                          child: Text1(
                        text: '60',
                        size: 20,
                        color: Colors.black,
                      )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    DefaultButton(
                      text: 'Send',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(mid.text + oral.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
