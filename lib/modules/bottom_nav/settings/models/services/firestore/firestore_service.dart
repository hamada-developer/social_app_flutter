import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/models/repositories/user_repo.dart';

class FirestoreService extends UserRepo{

  late FirebaseFirestore _firebaseFirestore;
  late SettingsModels _models;

  FirestoreService(){
    _firebaseFirestore = FirebaseFirestore.instance;
  }
  @override
  Future<SettingsModels> userInfo() async{
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore.collection('Users').doc(AppStrings.uId).get();
      _models = SettingsModels.fromJson(snapshot.data());
    } on Exception catch (error) {
      print('Error when get Data from fire store [FirestoreService] ${error.toString()}');
    }
    return _models;
  }

}