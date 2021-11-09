import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';

abstract class UserRepo {

  Future<SettingsModels> userInfo();
}
