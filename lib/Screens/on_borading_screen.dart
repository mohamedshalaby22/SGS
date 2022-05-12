import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/login.dart';
import 'package:flutter_application_3/Services/sharedprefrences.dart';
import 'package:flutter_application_3/components/default_button.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:get/get.dart';

import '../controller/bottomnavb.dart';

class OnBoardingScrean extends StatefulWidget {
  const OnBoardingScrean({Key? key}) : super(key: key);

  @override
  State<OnBoardingScrean> createState() => _OnBoardingScreanState();
}

class _OnBoardingScreanState extends State<OnBoardingScrean> {
  List splashData = [
    {
      "text":
          "Welcome to DAS, It's Our App!\nYou are always assured of a pleasant welcome.",
      "image": "assets/b1.png"
    },
    {
      "text":
          "Try working in an adjective to describe\n the quality of your welcome more fully.",
      "image": "assets/b2.png"
    },
    {
      "text":
          "It's gratifying to look around and see so many familiar faces.This is feel-good central and we aim ",
      "image": "assets/b3.png"
    },
  ];

  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BottomNavBar controller = BottomNavBar();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                _controller.jumpToPage(splashData.length);
              },
              child: Text(
                controller.isSelected.value == splashData.length - 1
                    ? ''
                    : 'Skip',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) {
                    controller.changeIsSelected(value);
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const DasText(),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Text(
                          splashData[index]['text'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black45),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                          width: width,
                          height: height * 0.30,
                          child: Image.asset(splashData[index]['image']))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: defaultPading * 2.3,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          margin: const EdgeInsets.only(right: 7),
                          width: controller.isSelected.value == index ? 35 : 15,
                          height: 5,
                          decoration: BoxDecoration(
                              color: controller.isSelected.value == index
                                  ? primaryColor
                                  : const Color(0xffd8d8d8),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    const Spacer(),
                    DefaultButton(
                        text:
                            controller.isSelected.value == splashData.length - 1
                                ? 'Continue'
                                : 'Next',
                        onPressed: () async {
                          if (controller.isSelected.value ==
                              splashData.length - 1) {
                            await SharedPrefrencesStorage.saveIsFirst(false);

                            Get.offAll(() => SignIn(),
                                transition: Transition.leftToRight);
                          }
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                        }),
                    const Spacer(),
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

class DasText extends StatelessWidget {
  const DasText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'SGS',
      style: TextStyle(
          color: primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
