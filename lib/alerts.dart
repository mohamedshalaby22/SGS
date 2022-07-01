import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alerts {
  static showLoading() {
    return Get.dialog(
        Dialog(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircularProgressIndicator(),
              // SizedBox(width: 32),
              Text("Loading please wait..."),
            ],
          ),
        )),
        barrierDismissible: false);
  }

  static showSnackBar({String? msg, bool isError = true}) {
<<<<<<< HEAD
    // print(msg);
    // print(isError);
=======
>>>>>>> ef3ebb0f2870e8b3d816f6582cbcbecb1b75e211
    if (isError) {
      msg = msg ?? 'SomeThing went wrong ,please try again later.';
    }
    return Get.snackbar(isError ? "Error" : "Succes", msg ?? "");
  }
}
