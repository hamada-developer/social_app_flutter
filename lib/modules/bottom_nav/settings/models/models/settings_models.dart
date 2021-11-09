class SettingsModels{

  late String name;
  late String urlImageCover ;
  late String urlImageProfile;
  late String bio;


  SettingsModels.fromJson(Map<String, dynamic>? json){
    try {
      name = json!['name'];
      urlImageCover = json['urlImageCover'];
      urlImageProfile = json['urlImageProfile'];
      bio = json['bio'];
    } on Exception catch (error) {
      print('Error when put data in [settingsModels] ${error.toString()}');
    }
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'urlImageCover' : urlImageCover,
      'urlImageProfile' : urlImageCover,
      'bio' : bio,
    };
  }
}