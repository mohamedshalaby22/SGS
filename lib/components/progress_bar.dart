import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/question.dart';
import 'package:get/get.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) => Stack(
          children: [
            LayoutBuilder(builder: ((context, constraints) {
              return Container(
                width: constraints.maxWidth * controller.animation!.value,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(colors: [
                      Color(0xff88cdf6),
                      Color(0xff6a9cfd),
                    ])),
              );
            })),
            Positioned.fill(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPading / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text1(
                      text: '${(controller.animation!.value * 60).round()} sec',
                      color: wprimary,
                    ),
                    Icon(Icons.watch_later, color: Colors.grey.shade800)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
