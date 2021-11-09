import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_cubit.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_states.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/events/login_events.dart';
import 'package:social_app/modules/auth/views/widgets/login_button.dart';
import 'package:social_app/utils/widgets/default_button.dart';
import 'package:social_app/utils/widgets/default_circle_laoding.dart';
import 'package:social_app/utils/widgets/default_text_fromfield.dart';
import 'package:social_app/modules/auth/views/widgets/password__login_widget.dart';
import 'package:social_app/utils/navigations.dart';
import 'package:social_app/utils/widgets/vertical_separated.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = LoginCubit.get(context);
    final LoginEvents events = LoginEvents();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.loginTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
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
                    controller: cubit.emailController,
                    labelText: AppStrings.labelEmail,
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    validator: events.checkEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const VerticalSeparated(),

                  /// Password
                  const PasswordLoginWidget(),
                  const VerticalSeparated(),

                  /// Login Button
                  const LoginButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.loginText_1,
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(
                            context: context,
                            route: AppStrings.registerScreen,
                          );
                        },
                        child: Text(
                          AppStrings.loginText_2.toUpperCase(),
                        ),
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
