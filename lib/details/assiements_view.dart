// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/questions.dart';
import 'package:flutter_application_3/components/progress_bar.dart';
import 'package:flutter_application_3/components/question_options.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/controller/question.dart';
import 'package:get/get.dart';

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
        appBar: AppBar(actions: [
          TextButton(
              onPressed: () {
                _controller.nextQuestion();
              },
              child: Text1(
                text: 'Skip',
                color: primaryColor,
                size: 18,
              ))
        ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPading, vertical: defaultPading / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProgressBar(),
              const SizedBox(
                height: defaultPading,
              ),
              Obx(
                () => Text.rich(
                  TextSpan(
                      text: 'Question ${_controller.questionNum.value}',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 30),
                      children: [
                        TextSpan(
                          text: '/${_controller.questions.length}',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 22),
                        ),
                      ]),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: defaultPading,
              ),
              Expanded(
                flex: 4,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: _controller.updateQuNum,
                  controller: _controller.pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.questions.length,
                  itemBuilder: (context, index) => QuestionsAsks(
                    question: _controller.questions[index],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class QuestionsAsks extends StatelessWidget {
  final QuestionController _controller = Get.put(QuestionController());
  QuestionsAsks({
    Key? key,
    required this.question,
  }) : super(key: key);
  Question question;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPading),
      margin:
          const EdgeInsets.only(top: defaultPading, bottom: defaultPading / 2),
      decoration: decoration,
      child: Column(
        children: [
          Text1(
            text: question.question,
            color: Colors.grey.shade600,
          ),
          const SizedBox(
            height: defaultPading,
          ),
          ...List.generate(
              question.options.length,
              (index) => AnswerQuestion(
                    text: question.options[index],
                    onPress: () {
                      _controller.checkAnswer(question, index);
                    },
                    index: index,
                  ))
        ],
      ),
    );
  }
}


/*
 Padding(
        padding: const EdgeInsets.only(
            top: defaultPading * 4, left: defaultPading, right: defaultPading),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text1(
              text: 'All Of These Questions Must Be Solved',
              size: 17,
              color: Colors.grey.shade900,
            ),
            const SizedBox(
              height: defaultPading,
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(defaultPading),
                        margin: const EdgeInsets.only(
                            top: defaultPading, bottom: defaultPading / 2),
                        decoration: decoration,
                        child: Column(
                          children: [
                            Text1(
                              text:
                                  '1. Which Of These Answer Is The Correct One ?',
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(
                              height: defaultPading / 2,
                            ),
                            const AnswerQuestion(),
                            const AnswerQuestion(),
                            const AnswerQuestion(),
                            const AnswerQuestion(),
                          ],
                        ),
                      )),
            ),
          ],
        ),
      ),
*/