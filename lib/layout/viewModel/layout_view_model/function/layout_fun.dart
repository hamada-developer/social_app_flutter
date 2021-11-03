import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart' show BuildContext;
import 'package:fluttertoast/fluttertoast.dart'
    show Fluttertoast, ToastGravity, Toast;
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/appBar/notifications/views/screens/notification_screen.dart';
import 'package:social_app/utils/navigations.dart';

class LayoutFun {
  void sendEmailVerification() {
    try {
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      showToast(AppStrings.toastCheckYourEmail);
    } on Exception catch (error) {
      print('Error when send email verification ${error.toString()}');
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

  void notificationButton(BuildContext context){
    navigateTo(context: context , route: AppStrings.notificationScreen);
  }
  void searchButton(BuildContext context){
    navigateTo(context: context , route: AppStrings.searchScreen);
  }
}
