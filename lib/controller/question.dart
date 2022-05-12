import 'package:flutter/cupertino.dart';
import 'package:flutter_application_3/Models/questions.dart';
import 'package:flutter_application_3/details/score.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;
  Animation? get animation => _animation;
  PageController? _pageController;
  PageController? get pageController => _pageController;
  final List<Question> _question = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            answer: question['answer_index'],
            options: question['options'],
          ))
      .toList();
  List<Question> get questions => _question;
  @override
  void onInit() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        update();
      });
    _animationController!.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _animationController!.dispose();
    _pageController!.dispose();
    super.onClose();
  }

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _correctAns = 0;
  int? get correctAns => _correctAns;

  int? _isSelectedAns;
  int? get isSelected => _isSelectedAns;

  final RxInt _questionNum = 1.obs;
  RxInt get questionNum => _questionNum;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _isSelectedAns = selectedIndex;
    if (_correctAns == _isSelectedAns) {
      _numOfCorrectAns++;
    }
    _animationController!.stop();
    update();

    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNum.value != _question.length) {
      _isAnswered = false;
      _pageController!.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      _animationController!.reset();
      _animationController!.forward().whenComplete(nextQuestion);
    } else {
      Get.to(const ScorePage(), transition: Transition.leftToRight);
    }
  }

  void updateQuNum(int index) {
    _questionNum.value = index + 1;
  }
}
