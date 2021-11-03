import 'package:flutter/material.dart'
    show Route, RouteSettings, BuildContext, MaterialPageRoute;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/layout/view/app_layout.dart';
import 'package:social_app/modules/appBar/notifications/views/screens/notification_screen.dart';
import 'package:social_app/modules/appBar/search/views/screens/home_screen.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_cubit.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/cubit/register_cubit.dart';
import 'package:social_app/modules/auth/views/screens/login_screen.dart';
import 'package:social_app/modules/auth/views/screens/register_screen.dart';
import 'package:social_app/modules/bottom_nav/post/views/screens/add_post.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.loginScreen:
        return AppStrings.uId == null
            ? MaterialPageRoute(
                builder: (BuildContext context) => BlocProvider(
                  create: (BuildContext context) => LoginCubit(),
                  child: const LoginScreen(),
                ),
              )
            : MaterialPageRoute(
                builder: (BuildContext context) => const AppLayout(),
              );
      case AppStrings.registerScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
        );
      case AppStrings.appLayoutScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AppLayout(),
        );
      case AppStrings.notificationScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const NotificationScreen(),
        );
      case AppStrings.searchScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SearchScreen(),
        );
      case AppStrings.addPostScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AddPostScreen(),
        );
    }
  }
}
