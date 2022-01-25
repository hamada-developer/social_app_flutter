import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart' show BuildContext, MaterialPageRoute, Navigator, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/models/services/firestore/firestore_service.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_states.dart';

import '../settings_screen_view_model.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  // *variable
  ImagePicker imagePicker = ImagePicker();
  XFile? coverImage;
  XFile? profileImage;
  String? getDownloadURLCover ;
  String? getDownloadURLProfile ;

  late FirebaseFirestore _firebaseFirestore;

  late SettingsModels _settingsModels;
  late SettingsModels _oldSettingModels;

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isEnable = false;


  // *constructor
  SettingsCubit() : super(InitialSettingsStates());

  static SettingsCubit get(BuildContext context) => BlocProvider.of(context);

  // *initialization data
  void getData() async {
    // * dependency injection injection
    SettingsScreenViewModel viewModel =
    SettingsScreenViewModel(FirestoreService());
    viewModel.getSettingData().then((settingModel) {
      emit(GetDataSettingSuccessfulState(settingModel));
      _oldSettingModels = settingModel;
    }).catchError((onError) {
      print('Error GetData on setting edit_cubit ${onError.toString()}');
    });
  }

  // * selecting images from gallery
  void selectImageForCover() async {
    try {
      coverImage = await imagePicker.pickImage(source: ImageSource.gallery);
      emit(SuccessSelectImageForCover(coverImage!));
      uploadCoverImage();
    } on Exception catch (e) {
      print('Error when _selectImageForCover ${e.toString()}');
      emit(ErrorSelectImageForCover());
    }
  }

  void selectImageForProfile() async {
    try {
      profileImage = await imagePicker.pickImage(source: ImageSource.gallery);
      emit(SelectProfileImageState(profileImage!));
      uploadProfileImage();
    } on Exception catch (e) {
      print('Error when _selectImageForProfile ${e.toString()}');
      emit(ErrorSelectImageForProfile());
    }
  }

  // * Uploading images to storage
  void uploadCoverImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('${AppStrings.usersTitle}/${Uri.parse(coverImage!.path).pathSegments.last}')
        .putFile(File(coverImage!.path))
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        getDownloadURLCover = value;
        emit(CoverImageUpdatingState(true));
      }).catchError((onError) {
        print(
            'Error: when getting download url cover image ${onError.tostring}');
      });
    }).catchError((onError) {
      print('Error: when uploading cover image {${onError.toString()}}');
    });
  }

  void uploadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('${AppStrings.usersTitle}/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}')
        .putFile(File(profileImage!.path))
        .then((value)
    {
      value.ref.getDownloadURL().then((value) {
        getDownloadURLProfile = value;
        emit(ProfileImageUpdatingState(true));
      });
    });
  }

  // *initialization firebase fireStore to use update
  void initializeFirebaseFirestore() {
    _firebaseFirestore = FirebaseFirestore.instance;
  }


  void updateData({
    String? name,
    String? bio,
    String? phone,
    required BuildContext context,
  }) {
    _settingsModels = SettingsModels(
      name: name,
      bio: bio,
      phoneNumber: phone,
      urlImageProfile:
          getDownloadURLProfile ?? _oldSettingModels.urlImageProfile,
      urlImageCover: getDownloadURLCover ?? _oldSettingModels.urlImageCover,
    );
    updateFirestore(context);
  }

  void updateFirestore(BuildContext context){
    try {
      initializeFirebaseFirestore();
      _firebaseFirestore.collection(AppStrings.usersTitle)
      .doc(AppStrings.uId)
      .update(_settingsModels.toMap()).then((value) {
        print('update is done');
        emit(SuccessUpdateData(_settingsModels));
        navigateBack(context);
      }).catchError((onError){
        print('Error: when updating FireStore update() ${onError.toString()}');
      });
    } on Exception catch (e) {
      print('Error: when updating FireStore ${e.toString()}');
    }
  }

  void navigateBack(BuildContext context){
    Navigator.pop(context);
  }

  void changeName() {
    if (nameController.text != _oldSettingModels.name) {
      emit(NameUpdatingState(nameController, true));
    }
    else if (nameController.text == _oldSettingModels.name &&
        bioController.text != _oldSettingModels.bio ||
        phoneController.text != _oldSettingModels.phoneNumber ||
        getDownloadURLCover != null || getDownloadURLProfile !=null
    ) {
      emit(BioUpdatingState(bioController, true));
    }
    else {
      isEnable = false;
      emit(NameUpdatingState(nameController, false));
    }
  }

  void changeBio() {
    if (bioController.text != _oldSettingModels.bio) {
      emit(BioUpdatingState(bioController, true));
    } else if (bioController.text == _oldSettingModels.bio &&
            nameController.text != _oldSettingModels.name ||
        phoneController.text != _oldSettingModels.phoneNumber ||
        getDownloadURLCover != null || getDownloadURLProfile !=null) {
      emit(BioUpdatingState(bioController, true));
    } else {
      emit(BioUpdatingState(bioController, false));
    }
  }

  void changePhone() {
    if (phoneController.text != _oldSettingModels.phoneNumber) {
      emit(PhoneUpdatingState(phoneController, true));
    }
    else if (phoneController.text == _oldSettingModels.phoneNumber &&
        nameController.text != _oldSettingModels.name ||
        bioController.text != _oldSettingModels.bio ||
        getDownloadURLCover != null || getDownloadURLProfile !=null) {
      emit(BioUpdatingState(bioController, true));
    }
    else {
      emit(PhoneUpdatingState(phoneController, false));
    }
  }
}
