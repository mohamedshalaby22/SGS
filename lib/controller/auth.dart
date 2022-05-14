// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/user_model.dart';
import 'package:flutter_application_3/Services/sharedprefrences.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  String? email, password, name, selectedItem;
  var resetEmail = TextEditingController();
  var isLoading = false.obs;
  Rx<UserModel> userModel = UserModel().obs;
  var isChecked = false.obs;
  var isProfilePickedPath = false.obs;
  var profilePickedPath = "".obs;
  String? imagePath;
  bool get loggedUserIsNotNull => userModel.value.id != null;
  emptyProfilePickedPath() {
    profilePickedPath.value = '';
    isProfilePickedPath.value = false;
  }
  // FirebaseAuth auth = FirebaseAuth.instance;
  // final Rxn<User> _user = Rxn<User>();
  //عشان اعرض قيمه اليوزر
  // String? get user => _user.value?.email;

  // void SignInWithEmailAndPassword(context) async {
  //   try {
  //     await auth
  //         .signInWithEmailAndPassword(email: email!, password: password!)
  //         .then((value) => snackBar(context, 'Successfully Login!'));
  //     Get.offAll(() => const HomeLayOut(), transition: Transition.leftToRight);
  //   } on FirebaseException catch (e) {
  //     print(e.message);
  //     snackBar(context, e.message.toString());
  //   }
  // }

  // void CreateAccountWithEmailAndPassword(context) async {
  //   try {
  //     await auth
  //         .createUserWithEmailAndPassword(
  //       email: email!,
  //       password: password!,
  //     )
  //         .then((user) async {
  //       saveUser(user);
  //     });
  //     snackBar(context, 'Successfully Registerd!  $name');
  //     Get.offAll(() => const HomeLayOut(), transition: Transition.leftToRight);
  //   } on FirebaseException catch (e) {
  //     snackBar(context, e.message.toString());
  //   }
  // }

  // void ForgetPassword(String email, context) async {
  //   try {
  //     await auth.sendPasswordResetEmail(email: email).then((value) async {
  //       Get.to(() => SignIn(), transition: Transition.leftToRight);
  //     });
  //     snackBar(context, 'password Reseted Check Email!');
  //   } on FirebaseException catch (e) {
  //     snackBar(context, e.message.toString());
  //   }
  // }

  // void saveUser(UserCredential user) async {
  //   await FireStoreUser().addUserToFirestore(UserModel(
  //     userId: user.user!.uid,
  //     email: user.user!.email,
  //     name: name,
  //     selectedItem: item,
  //     pic: '',
  //   ));
  // }

//DrobDownButton
  String? item;
  List<String> items = [
    'First Level',
    'Second Level',
    'Third Level',
    'Fourth Level',
  ];
  void ChangeSelected(value) {
    item = value;
  }

  String? item2;
  List<String> items2 = [
    'Information Technology (IT)',
    'Information System (IS)',
    'Computer System (Cs)',
  ];
  void ChangeSelected2(value) {
    item = value;
  }

  //Loading CircleProgress In Press Login
  void loadCircleProgress() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
  }

//CHEACK BOX
  OnPageChanged(bool value) {
    isChecked.value = value;
  }

  //IMAGE PICKER
  void pickedPath(String path) {
    profilePickedPath.value = path;
    isProfilePickedPath.value = true;
  }

  Future<void> getUser() async {
    userModel.value = (await SharedPrefrencesStorage.getSavedUser())!;
  }

  //Suffix Icon password
  RxBool isPassword = true.obs;
  IconData suffixIcon = Icons.visibility_off_outlined;
  void changeSuffixIcon() {
    isPassword.value = !isPassword.value;
    suffixIcon = isPassword.value
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
  }

  void snackBar(BuildContext context, String text) {
    final snackbar = SnackBar(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
