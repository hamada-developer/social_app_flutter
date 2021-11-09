import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'
    show BuildContext, FormState, GlobalKey, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/constants/collections.dart';
import 'package:social_app/modules/auth/models/models/users_model.dart';
import 'package:social_app/modules/auth/models/services/sharedPreferences/cach_helper.dart';

import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {

  /*Variables*/
  bool _isHide = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  late FirebaseAuth _firebaseAuth;
  late FirebaseFirestore _firebaseFirestore;
  late UserModel _userModel;

  /*Constructor*/
  RegisterCubit() : super(InitialLoginState());

  /*Instance*/
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  /*Initialization*/
  void initializeFirebaseAuth(){
    _firebaseAuth = FirebaseAuth.instance;
  }
  void initializeFirebaseFireStore(){
    _firebaseFirestore = FirebaseFirestore.instance;
  }

  /*Emit states*/
  void toggleObscure() {
    _isHide = !_isHide;
    emit(ToggleObscure());
  }

  createUser({
    required String uId,
    required String email,
    required String phoneNumber,
    required String userName,
  }) {
    try {
      /// 1- initialize fireStore
      initializeFirebaseFireStore();

      /// 2- create instance of UserModel
      _userModel = UserModel(name: userName, emailAddress: email, phoneNumber: phoneNumber, uId: uId);

      /// 3- create {Users -> uId -> [data]}
      _firebaseFirestore.collection(users).doc(uId).set(_userModel.toMap());

      /// 4- save uId in shredPreferences
      saveUserIdToSharedPref(_userModel.uId.toString());

      /// 5-set state Success
      emit(SuccessRegisterState());
    } on Exception catch (error) {
      print('Error when crateUser fireStore ${error.toString()}');
    }
  }

  /*Functions*/
  void loginButton() {
    if (formKey.currentState!.validate()) {
      /// 1- set state Loading
      emit(LoadingRegisterState());
      /// 2- call function registerFirebase
      registerFirebase();
    } else {
      /// field is empty
      print('Not Valid');
    }
  }
  void registerFirebase() async {
    try {
      /// 1-initialize authentication
      initializeFirebaseAuth();

      /// 2-authentication firebase
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      /// 3-create user in fireStore
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
  void saveUserIdToSharedPref(String uId) {
    AppStrings.uId = uId;
    CacheHelper.saveString(key: AppStrings.uIdKey , value: AppStrings.uId.toString());
  }

  /*Encapsulations*/
  bool get getIsHide => _isHide;
}
