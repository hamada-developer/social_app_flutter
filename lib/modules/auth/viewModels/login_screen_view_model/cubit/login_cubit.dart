import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'
    show BuildContext, FormState, GlobalKey, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/models/models/users_model.dart';
import 'package:social_app/modules/auth/models/services/sharedPreferences/cach_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {


  /*Variables*/
  bool _isHide = true;
  final formKey = GlobalKey<FormState>();
  late FirebaseAuth _firebaseAuth;
  late UserModel _userModel;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /*Constructor*/
  LoginCubit() : super(InitialLoginState());

  /*Instances*/
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  /*Initialization*/
  void initFirebaseAuthentication() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  /*Emit states*/
  void toggleObscure() {
    _isHide = !_isHide;
    emit(ToggleObscure());
  }

  /*Functions*/
  void loginToFirebase() async {
    try {
      /// 1- set state [LoadingLoginState]
      emit(LoadingLoginState());

      /// 2- initial Firebase Authentication
      initFirebaseAuthentication();

      /// 3- calling function [_firebaseAuth.signInWithEmailAndPassword]
      /// set [emailController] and [passwordController]
      UserCredential userCredential =
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      /// 4- save [uId] in shared preferences by function [saveUserIdToSharedPref]
      saveUserIdToSharedPref(userCredential.user!.uid);

      /// 5- Get user information from [Fire Store] database
      /// // TODO remove getData from fire store in this

      /// 6- set state [SuccessLoginState] it's success
      emit(SuccessLoginState());
    } on Exception catch (error) {
      print('Error: ${error.toString()}');
      emit(ErrorLoginState(error.toString()));
    }
  }
  void loginButton() {
    if (formKey.currentState!.validate()) {
      loginToFirebase();
    }
    else{
      print('Not valid');
    }
  }
  void saveUserIdToSharedPref(String uId) {
    AppStrings.uId = uId;
    CacheHelper.saveString(
      key: AppStrings.uIdKey,
      value: AppStrings.uId.toString(),
    );
  }

  /*Encapsulations*/
  bool get getIsHide => _isHide;
}
