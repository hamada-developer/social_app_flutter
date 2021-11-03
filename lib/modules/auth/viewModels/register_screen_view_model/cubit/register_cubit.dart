import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'
    show BuildContext, FormState, GlobalKey, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/models/models/users_model.dart';
import 'package:social_app/modules/auth/models/services/sharedPreferences/cach_helper.dart';

import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  bool _isHide = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  late FirebaseAuth _firebaseAuth;
  late FirebaseFirestore _firebaseFirestore;

  late UserModel _userModel;

  /// constructor
  RegisterCubit() : super(InitialLoginState());

  /// create a instance of this RegisterCubit
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  /// first state
  /// change state to [ToggleObscure]
  void toggleObscure() {
    _isHide = !_isHide;
    emit(ToggleObscure());
  }

  /// change state
  void loginButton() {
    if (formKey.currentState!.validate()) {
      emit(LoadingRegisterState());
      registerFirebase();
    } else {
      print('error');
    }
  }

  /// register method
  void registerFirebase() async {
    try {
      _firebaseAuth = FirebaseAuth.instance;
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      createUser(
        uId: userCredential.user!.uid,
        email: emailController.text,
        phoneNumber: phoneController.text,
        userName: userNameController.text,
      );
    } on Exception catch (error) {
      print('Error: ${error.toString()}');
      emit(ErrorRegisterState(error.toString()));
    }
  }

  createUser({
    required String uId,
    required String email,
    required String phoneNumber,
    required String userName,
  }) {
    try {
      _userModel = UserModel(userName: userName, emailAddress: email, phoneNumber: phoneNumber, uId: uId);
      _firebaseFirestore = FirebaseFirestore.instance;
      _firebaseFirestore.collection('Users').doc(uId).set(_userModel.toJSON());

      saveUserIdToSharedPref(_userModel.uId.toString());
      emit(SuccessRegisterState(_userModel));
    } on Exception catch (error) {
      print(error.toString());
    }
  }

  void saveUserIdToSharedPref(String uId) {
    AppStrings.uId = uId;
    CacheHelper.saveString(key: AppStrings.uIdKey , value: AppStrings.uId.toString());
  }

  bool get getIsHide => _isHide;
}
