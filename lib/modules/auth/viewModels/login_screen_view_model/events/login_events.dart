import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/constants/app_strings.dart';

class LoginEvents {
  /*Checker for text form field*/
  String? checkEmail(value) {
    if (value!.isEmpty) {
      return AppStrings.msgEmailError;
    } else {
      null;
    }
  }

  String? checkPassword(value) {
    if (value!.isEmpty) {
      return AppStrings.msgPasswordError;
    } else {
      null;
    }
  }

  /*Toasts*/
  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }
}
