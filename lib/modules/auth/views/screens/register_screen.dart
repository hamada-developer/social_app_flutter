import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/cubit/register_cubit.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/cubit/register_states.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/events/register_event.dart';
import 'package:social_app/modules/auth/views/widgets/password_register.dart';
import 'package:social_app/utils/widgets/default_text_fromfield.dart';
import 'package:social_app/modules/auth/views/widgets/register_button.dart';
import 'package:social_app/utils/widgets/vertical_separated.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterCubit cubit = RegisterCubit.get(context);
    final RegisterEvents events = RegisterEvents();
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
              key: cubit.formKey,
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
                    controller: cubit.userNameController,
                    labelText: AppStrings.labelUserName,
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    validator: events.chickUserName,
                    keyboardType: TextInputType.name,
                  ),
                  const VerticalSeparated(),
                  // Email Address
                  DefaultTextFormField(
                    controller: cubit.emailController,
                    labelText: AppStrings.labelEmail,
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    validator: events.chickEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const VerticalSeparated(),

                  /// Password
                  const PasswordRegister(),
                  const VerticalSeparated(),

                  /// Phone
                  DefaultTextFormField(
                    controller: cubit.phoneController,
                    labelText: AppStrings.labelPhone,
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    validator: events.chickPhone,
                    keyboardType: TextInputType.phone,
                  ),
                  const VerticalSeparated(),

                  /// Register Button
                  const RegisterButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

