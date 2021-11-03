import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_cubit.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_states.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/function/login_fun.dart';
import 'package:social_app/modules/auth/views/widgets/default_button.dart';
import 'package:social_app/modules/auth/views/widgets/default_text_fromfield.dart';
import 'package:social_app/utils/navigations.dart';
import 'package:social_app/modules/auth/views/widgets/vertical_separated.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = LoginCubit.get(context);
    final LoginFunction loginFunction = LoginFunction();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.loginTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: loginCubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Login Header
                  const Text(
                    AppStrings.loginHeader,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 43,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const VerticalSeparated(),

                  /// Login Body
                  const Text(
                    AppStrings.loginBody,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const VerticalSeparated(),
                  /// Email Address
                  DefaultTextFormField(
                    controller: loginCubit.emailController,
                    labelText: AppStrings.labelEmail,
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    validator: loginFunction.chickEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const VerticalSeparated(),
                  /// Password
                  BlocBuilder<LoginCubit, LoginStates>(
                    builder: (context, state) {
                      return DefaultTextFormField(
                        controller: loginCubit.passwordController,
                        labelText: AppStrings.labelPassword,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        obscureText: LoginCubit.get(context).getIsHide,
                        suffixIcon: IconButton(
                          onPressed: LoginCubit.get(context).toggleObscure,
                          icon: const Icon(
                            Icons.remove_red_eye_rounded,
                          ),
                        ),
                        validator: loginFunction.chickPassword,
                      );
                    },
                  ),
                  const VerticalSeparated(),
                  /// Login Button
                  BlocConsumer<LoginCubit, LoginStates>(
                    listener: (context, state) {
                      if (state is SuccessLoginState) {
                        // TODO go to the Home Screen
                        navigateToAndFinish(context: context, newRouteName: AppStrings.appLayoutScreen);
                      }
                      else if (state is ErrorLoginState) {
                        ///
                        loginFunction.showToast(state.error.toString(),);
                      }
                    },
                    builder: (context, state) {
                      return state is! LoadingLoginState ?
                      DefaultButton(
                        text: AppStrings.loginButton,
                        onPressed: loginCubit.loginButton,
                      ):
                      const Center(child: CircularProgressIndicator(),);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.loginText_1,
                      ),
                      TextButton(
                        onPressed: (){
                          navigateTo(context: context, route: AppStrings.registerScreen,);
                        },
                        child: Text(AppStrings.loginText_2.toUpperCase()),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
