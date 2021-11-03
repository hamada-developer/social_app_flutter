import 'package:social_app/modules/auth/models/services/sharedPreferences/cach_helper.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_cubit.dart';

class AppStrings {

  /// **UserID
  /// this is variable receives [uid] or maybe is[nullable] ???
  static String? uId = CacheHelper.getData(key: AppStrings.uIdKey) ;

  static const String uIdKey = 'uId';

  static const String loginTitle = 'LoginScreen';
  static const String loginHeader = 'Login';
  static const String loginBody = 'Login now to communicate with friends';
  static const String labelEmail = 'Email Address';
  static const String labelPassword = 'Password';
  static const String loginButton = 'login';
  static const String loginText_1 = 'Don\'t have an account?';
  static const String loginText_2 = 'Register';
  static const String msgEmailError = 'Email is empty';
  static const String msgPasswordError = 'Password is empty';
  static const String msgUserNameError = 'User Name is empty';
  static const String msgPhoneError = 'Phone is empty';
  static const String loginScreen = '/';

  static const String registerScreen = 'Register';
  static const String registerHeader = 'Register';
  static const String registerBody =
      'Register now to communicate with friends ';
  static const String labelUserName = 'User Name';
  static const String labelPhone = 'Phone';
  static const String registerButton = 'Register';

  static const String appLayoutScreen = 'layout';
  static const String hintVerify = 'Please verify your email';
  static const String hintSend = 'Send';
  static const String toastCheckYourEmail = 'check your email';

  static const String homeTitle = 'Home';
  static const String chatsTitle = 'chats';
  static const String usersTitle = 'Users';
  static const String settingsTitle = 'Settings';
  static const String postTitle = 'Post';

  static const String notificationScreen = 'notification';
  static const String searchScreen = 'search';
  static const String addPostScreen = 'AddPost';
}
