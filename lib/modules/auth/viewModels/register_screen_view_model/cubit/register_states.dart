import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/modules/auth/models/models/users_model.dart';

abstract class RegisterStates {}

class InitialLoginState extends RegisterStates {}

class ToggleObscure extends RegisterStates {}

class LoadingRegisterState extends RegisterStates {}

class SuccessRegisterState extends RegisterStates {
  final UserModel userModel;

  SuccessRegisterState(this.userModel);
}

class ErrorRegisterState extends RegisterStates {
  final String error;

  ErrorRegisterState(this.error);
}
