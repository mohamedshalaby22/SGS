// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Services/api.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';

import '../components/formfield.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var newPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const LeadingIcon(),
        title: Text1(
          text: 'Forget Password',
          size: 20,
          color: primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPading),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text1(
                    text: 'Enter the new password To Reset Your old Password',
                    size: 18,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                    width: width,
                    height: height * 0.30,
                    child: Image.asset('assets/log.png')),
                const SizedBox(
                  height: defaultPading / 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text1(text: 'Enter the new password'),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        controller: newPassword,
                        onSave: (value) {
                          newPassword = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the new password';
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                        icon: Icons.email),
                    const SizedBox(
                      height: defaultPading,
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPading,
                ),
                Column(
                  children: [
                    DefaultButton(
                        text: 'SEND',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await Api.changeStudentPassword(newPassword.text,
                                showLoading: true);
                          }
                        }),
                    const SizedBox(
                      height: defaultPading,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
