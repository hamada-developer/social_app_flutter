import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/cubit/register_cubit.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/cubit/register_states.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/function/register_fun.dart';
import 'package:social_app/modules/auth/views/widgets/default_button.dart';
import 'package:social_app/modules/auth/views/widgets/default_text_fromfield.dart';
import 'package:social_app/utils/navigations.dart';
import 'package:social_app/modules/auth/views/widgets/vertical_separated.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = RegisterCubit.get(context);
    final RegisterFunction registerFunction = RegisterFunction();
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: registerCubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.registerHeader,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 43,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const VerticalSeparated(),
                  const Text(
                    AppStrings.registerBody,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const VerticalSeparated(),

                  /// User Name
                  DefaultTextFormField(
                    controller: registerCubit.userNameController,
                    labelText: AppStrings.labelUserName,
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    validator: registerFunction.chickUserName,
                    keyboardType: TextInputType.name,
                  ),
                  const VerticalSeparated(),
                  // Email Address
                  DefaultTextFormField(
                    controller: registerCubit.emailController,
                    labelText: AppStrings.labelEmail,
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    validator: registerFunction.chickEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const VerticalSeparated(),

                  /// Password
                  BlocBuilder<RegisterCubit, RegisterStates>(
                    builder: (context, state) {
                      return DefaultTextFormField(
                        controller: registerCubit.passwordController,
                        labelText: AppStrings.labelPassword,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        obscureText: registerCubit.getIsHide,
                        suffixIcon: IconButton(
                          onPressed: registerCubit.toggleObscure,
                          icon: const Icon(
                            Icons.remove_red_eye_rounded,
                          ),
                        ),
                        validator: registerFunction.chickPassword,
                        keyboardType: TextInputType.visiblePassword,
                      );
                    },
                  ),
                  const VerticalSeparated(),

                  /// Phone
                  DefaultTextFormField(
                    controller: registerCubit.phoneController,
                    labelText: AppStrings.labelPhone,
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    validator: registerFunction.chickPhone,
                    keyboardType: TextInputType.phone,
                  ),
                  const VerticalSeparated(),

                  /// Register Button
                  BlocConsumer<RegisterCubit, RegisterStates>(
                    listener: (context, state) {
                      if (state is SuccessRegisterState) {
                        // TODO go to the Home Screen
                        navigateToAndFinish(context: context, newRouteName: AppStrings.appLayoutScreen);
                      }
                      else if (state is ErrorRegisterState) {
                        //TODO show toast to user
                        registerFunction.showToast(state.error.toString());
                      }
                    },
                    builder: (context, state) {
                      return state is! LoadingRegisterState ?
                      DefaultButton(
                        text: AppStrings.registerButton,
                        onPressed: () {
                          registerCubit.loginButton();
                        },
                      ):
                      const Center(child: CircularProgressIndicator());
                    },
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

/**
 * * Important information
 * ! Deprecated method, do not use
 * ? should this method be exposed
 * TODO: refactor this method
 */
