import 'package:social_app/modules/auth/models/models/users_model.dart';

abstract class LayoutState{}

class InitialLayoutState extends LayoutState{}

class ChangeBottomNavState extends LayoutState{}
class AddPostState extends LayoutState{}
class ConnectedState extends LayoutState{
  final UserModel userModel;
  ConnectedState(this.userModel);
}
class DisconnectedState extends LayoutState{}