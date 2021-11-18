class UserModel {
  /*variables*/
  String? name;
  String? bio;
  String? emailAddress;
  String? phoneNumber;
  String? uId;
  String? urlImageCover;
  String? urlImageProfile;

  /*constructor*/
  UserModel({
    required this.name,
    required this.emailAddress,
    required this.phoneNumber,
    required this.uId,
    this.bio = 'write your bio',
    this.urlImageCover = 'https://image.freepik.com/free-photo/gray-abstract-wireframe-technology-background_53876-101941.jpg',
    this.urlImageProfile = 'https://cdn-icons-png.flaticon.com/512/709/709722.png',
  });

  /*named constructor*/
  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    uId = json['uId'];
    bio = json['bio'];
    urlImageCover = json['urlImageCover'];
    urlImageProfile = json['urlImageProfile'];
  }

  /*toMap*/
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'uId': uId,
      'urlImageCover': urlImageCover,
      'urlImageProfile': urlImageProfile,
      'bio': bio,
    };
  }
}
