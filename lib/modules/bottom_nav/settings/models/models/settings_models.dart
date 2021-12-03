class SettingsModels{

  late String? name;
  late String? urlImageCover ;
  late String? urlImageProfile;
  late String? bio;
  late String? phoneNumber;


  SettingsModels({
    this.name,
    this.phoneNumber,
    this.urlImageCover,
    this.bio,
    this.urlImageProfile,
});

  SettingsModels.fromJson(Map<String, dynamic>? json){
    try {
      name = json!['name'];
      urlImageCover = json['urlImageCover'];
      urlImageProfile = json['urlImageProfile'];
      bio = json['bio'];
      phoneNumber = json['phoneNumber'];
    } on Exception catch (error) {
      print('Error when put data in [settingsModels] ${error.toString()}');
    }
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'urlImageCover' : urlImageCover,
      'urlImageProfile' : urlImageProfile,
      'bio' : bio,
      'phoneNumber' : phoneNumber,
    };
  }
}