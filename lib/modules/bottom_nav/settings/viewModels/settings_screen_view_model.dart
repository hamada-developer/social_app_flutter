import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/models/repositories/user_repo.dart';

class SettingsScreenViewModel {
  // var of super class
  final UserRepo _userRepo;

  // model
  late SettingsModels _models;

  SettingsScreenViewModel(this._userRepo);

  Future<SettingsModels> getSettingData() async {
    try {
      _models = await _userRepo.userInfo();
    } on Exception catch (error) {
      print('Error when getUrlImageCover ${error.toString()}');
    }
    return _models;
  }
}
