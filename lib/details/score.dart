import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/question.dart';
import 'package:get/get.dart';

import 'aaignments.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => Assignments(),
                  transition: Transition.leftToRight);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              Text1(
                text: 'Score',
                color: primaryColor,
                size: 35,
              ),
              const Spacer(),
              Text1(
                text:
                    "${_qnController.correctAns!.toInt() * 10}/${_qnController.questions.length * 10}",
                color: Colors.grey.shade600,
                size: 30,
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
