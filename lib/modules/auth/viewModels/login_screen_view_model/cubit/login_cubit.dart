import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'
    show BuildContext, FormState, GlobalKey, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/models/services/sharedPreferences/cach_helper.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  bool _isHide = true;
  final formKey = GlobalKey<FormState>();

  late FirebaseAuth _firebaseAuth;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// constructor
  LoginCubit() : super(InitialLoginState());

  /// create a instance of this LoginCubit
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  /// first state
  /// change state to [ToggleObscure]
  void toggleObscure() {
    _isHide = !_isHide;
    emit(ToggleObscure());
  }

  ///  [LoginButton]
  void loginButton() {
    if (formKey.currentState!.validate()) {
      loginToFirebase();
    }
  }

  void initFirebaseAuthentication() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  /**
   ** loginToFirebase() is does five tasks
   */

  /// 1- set state [LoadingLoginState]
  /// 2- initial Firebase Authentication
  /// 3- calling function [_firebaseAuth.signInWithEmailAndPassword]
  /// set [emailController] and [passwordController]
  /// 4- save [uId] in shared preferences by function [saveUserIdToSharedPref]
  /// 5- set state [SuccessLoginState] it's success
  void loginToFirebase() async {
    try {
      emit(LoadingLoginState());
      initFirebaseAuthentication();
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      saveUserIdToSharedPref(userCredential.user!.uid);
      emit(SuccessLoginState());
    } on Exception catch (error) {
      print('Error: ${error.toString()}');
      emit(ErrorLoginState(error.toString()));
    }
  }

  void saveUserIdToSharedPref(String uId) {
    AppStrings.uId = uId;
    CacheHelper.saveString(key: AppStrings.uIdKey , value: AppStrings.uId.toString());
  }

  bool get getIsHide => _isHide;
}
