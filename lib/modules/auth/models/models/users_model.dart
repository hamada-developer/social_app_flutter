class UserModel {
  String? userName;
  String? emailAddress;
  String? phoneNumber;
  String? uId;

  UserModel({
    required this.userName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    emailAddress = json['emailAddress'];
    phoneNumber = json['phoneNumber'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJSON() {
    return {
      'userName': userName,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'uId': uId,
    };
  }
}
