// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';

class DegressPage extends StatelessWidget {
  const DegressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Text1(
                    text: 'Attachments',
                    size: 20,
                  ),
                  Text1(
                    text: ' - Degrees',
                    size: 20,
                    color: primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPading,
              ),
              Image.asset(
                'assets/grades.jpg',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: defaultPading,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(
                            color: Colors.grey.shade300,
                          )),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text1(
                            text: 'Degrees Title',
                            size: 17,
                            color: primaryColor,
                          ),
                          LocalSa(
                            text: 'Quizes',
                          ),
                          LocalSa(
                            text: 'Practical',
                          ),
                          LocalSa(
                            text: 'Oral',
                          ),
                          LocalSa(
                            text: 'Mid-Term',
                          ),
                          LocalSa(
                            text: 'Total',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(
                            color: Colors.grey.shade300,
                          )),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text1(
                            text: 'Degrees Value',
                            size: 17,
                            color: primaryColor,
                          ),
                          LocalSa(text: '20', color: Colors.grey.shade700),
                          LocalSa(text: '20', color: Colors.grey.shade700),
                          LocalSa(text: '20', color: Colors.grey.shade700),
                          LocalSa(text: '20', color: Colors.grey.shade700),
                          LocalSa(text: '80', color: Colors.grey.shade700),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LocalSa extends StatelessWidget {
  LocalSa({
    Key? key,
    this.color = const Color(0xffBDBDBD),
    required this.text,
  }) : super(key: key);
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text1(
              text: text,
              size: 17,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
