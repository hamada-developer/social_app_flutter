import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/constants/app_strings.dart';

class RegisterEvents {

  /*Checker for text form field*/
  String? chickUserName(value) {
    if (value!.isEmpty) {
      return AppStrings.msgUserNameError;
    } else {
      null;
    }
  }

  String? chickEmail(value) {
    if (value!.isEmpty) {
      return AppStrings.msgEmailError;
    } else {
      null;
    }
  }

  String? chickPhone(value) {
    if (value!.isEmpty) {
      return AppStrings.msgPhoneError;
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

  /*Toasts*/
  void showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }
}
