// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/question.dart';
import 'package:get/get.dart';

class AnswerQuestion extends StatelessWidget {
  AnswerQuestion(
      {Key? key,
      required this.text,
      required this.onPress,
      required this.index})
      : super(key: key);
  String text;
  int index;

  Function onPress;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qucontroller) {
          Color getRightColor() {
            if (qucontroller.isAnswered) {
              if (index == qucontroller.correctAns) {
                return Colors.green;
              } else if (index == qucontroller.isSelected &&
                  qucontroller.isSelected != qucontroller.correctAns) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getIcon() {
            return getRightColor() == Colors.red ? Icons.close : Icons.check;
          }

          return GestureDetector(
            onTap: () {
              onPress();
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: defaultPading),
              padding: const EdgeInsets.all(defaultPading),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: getRightColor()),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text1(
                    text: '${index + 1}: $text',
                    color: getRightColor(),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: getRightColor() == Colors.grey
                            ? Colors.transparent
                            : getRightColor(),
                        border: Border.all(
                          color: getRightColor(),
                        ),
                        shape: BoxShape.circle),
                    child: getRightColor() == Colors.grey
                        ? null
                        : Icon(
                            getIcon(),
                            color: wprimary,
                            size: 16,
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
