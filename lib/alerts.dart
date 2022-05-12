import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alerts {
  static showLoading() {
    return Get.dialog(
        Dialog(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 32),
              Text("Loading please wait..."),
            ],
          ),
        )),
        barrierDismissible: false);
  }

  static showSnackBar({String? msg, bool isError = true}) {
    if (isError) {
      msg = msg ?? 'SomeThing went wrong ,please try again later.';
    }
    return Get.snackbar(isError ? "Error" : "Succes", msg ?? "");
  }
}
