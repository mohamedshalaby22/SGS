import 'package:flutter_application_3/controller/auth.dart';
import 'package:flutter_application_3/controller/question.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => QuestionController());
  }
}
