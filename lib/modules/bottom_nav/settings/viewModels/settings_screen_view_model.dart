import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/models/repositories/user_repo.dart';

class SettingsScreenViewModel {
  // var of super class
  final UserRepo userRepo;
  // model
  late SettingsModels models;

  SettingsScreenViewModel(this.userRepo);

  Future<SettingsModels> getUrlImageCover() async {
    try {
      models = await userRepo.userInfo();
    } on Exception catch (error) {
      print('Error when getUrlImageCover ${error.toString()}');
    }
    return models;
  }
}
