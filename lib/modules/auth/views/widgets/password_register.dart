import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/cubit/register_cubit.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/cubit/register_states.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/events/register_event.dart';
import 'package:social_app/utils/widgets/default_text_fromfield.dart';

class PasswordRegister extends StatelessWidget {
  const PasswordRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final RegisterCubit cubit = RegisterCubit.get(context);
    final RegisterEvents events = RegisterEvents();
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        return DefaultTextFormField(
          controller: cubit.passwordController,
          labelText: AppStrings.labelPassword,
          prefixIcon: const Icon(
            Icons.lock,
          ),
          obscureText: cubit.getIsHide,
          suffixIcon: IconButton(
            onPressed: cubit.toggleObscure,
            icon: const Icon(
              Icons.remove_red_eye_rounded,
            ),
          ),
          validator: events.chickPassword,
          keyboardType: TextInputType.visiblePassword,
        );
      },
    );
  }
}
