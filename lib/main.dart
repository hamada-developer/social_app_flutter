import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/utils/router/app_router.dart';
import 'constants/observer.dart';
import 'modules/auth/models/services/sharedPreferences/cach_helper.dart';
import 'style/themes/dark_theme_app.dart';
import 'style/themes/light_theme_app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  /// initialize firebase
  await Firebase.initializeApp();
  /// initialize sharedPreferences
  await CacheHelper.initSharedPreferences();
  /// observer cubit
  Bloc.observer = MyBlocObserver();

  /// run application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

