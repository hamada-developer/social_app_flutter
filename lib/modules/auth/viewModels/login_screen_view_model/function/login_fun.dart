import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_cubit.dart';

class LoginFunction {
  String? chickEmail(value) {
    if (value!.isEmpty) {
      return AppStrings.msgEmailError;
    } else {
      null;
    }
  }

  String? chickPassword(value) {
    if (value!.isEmpty) {
      return AppStrings.msgPasswordError;
    } else {
      null;
    }
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
}
