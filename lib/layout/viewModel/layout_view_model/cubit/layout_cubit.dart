import 'package:flutter/material.dart' show BuildContext, SizedBox, Widget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/bottom_nav/chats/views/screens/chats_screen.dart';
import 'package:social_app/modules/bottom_nav/home/views/screens/home_screen.dart';
import 'package:social_app/modules/bottom_nav/settings/views/screens/settings_screen.dart';
import 'package:social_app/modules/bottom_nav/users/views/screens/home_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {

  int _currentIndex = 0;

  /*Screens of bottom navigation*/
  List<Widget> screen = [
    const HomeScreen(),
    const ChatsScreen(),
    const SizedBox(),
    const UsersScreen(),
    const SettingsScreen(),
  ];

  /*titles of Screens bottom navigation*/
  List<String> titles = [
    AppStrings.homeTitle,
    AppStrings.chatsTitle,
    AppStrings.chatsTitle,
    AppStrings.usersTitle,
    AppStrings.settingsTitle,
  ];

  LayoutCubit() : super(InitialLayoutState());

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(AddPostState());
    } else {
      _currentIndex = index;
      emit(ChangeBottomNavState());
    }
  }
  /*Encapsulation*/
int get currentIndex => _currentIndex;
}
