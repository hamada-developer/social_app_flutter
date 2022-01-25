import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';

abstract class SettingsStates {}

//* Initial State
class InitialSettingsStates extends SettingsStates{}

//* Getting Data State
class GetDataSettingSuccessfulState extends SettingsStates{

  final SettingsModels settingsModels;

  GetDataSettingSuccessfulState(this.settingsModels);
}
class GetDataSettingErrorState extends SettingsStates{

  final String error;

  GetDataSettingErrorState(this.error);
}

//* Selecting State
class SuccessSelectImageForCover extends SettingsStates{
  final XFile xFile;

  SuccessSelectImageForCover(this.xFile);
}
class ErrorSelectImageForCover extends SettingsStates{}

class SelectProfileImageState extends SettingsStates{
  final XFile xFile;

  SelectProfileImageState(this.xFile);
}
class ErrorSelectImageForProfile extends SettingsStates{}

//* Updating Data State
class SuccessUpdateData extends SettingsStates{

  final SettingsModels settingsModels;

  SuccessUpdateData(this.settingsModels);
}
class ErrorUpdateDate extends SettingsStates{}

//* enabled button
class NameUpdatingState extends SettingsStates{
  TextEditingController nameController;
  bool isEnabled;
  NameUpdatingState(this.nameController, this.isEnabled);
}
class BioUpdatingState extends SettingsStates{
  TextEditingController bioController;
  bool isEnabled;
  BioUpdatingState(this.bioController, this.isEnabled);
}
class PhoneUpdatingState extends SettingsStates{
  TextEditingController phoneController;
  bool isEnabled;
  PhoneUpdatingState(this.phoneController, this.isEnabled);
}

class CoverImageUpdatingState extends SettingsStates{
  bool isEnabled;
  CoverImageUpdatingState(this.isEnabled);
}
class ProfileImageUpdatingState extends SettingsStates{
  bool isEnabled;
  ProfileImageUpdatingState(this.isEnabled);
}