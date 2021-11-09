import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_cubit.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_states.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/events/login_events.dart';
import '../../../../utils/widgets/default_text_fromfield.dart';

class PasswordLoginWidget extends StatelessWidget {
  const PasswordLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        final LoginCubit cubit = LoginCubit.get(context);
        final LoginEvents events = LoginEvents();
        return DefaultTextFormField(
          controller: cubit.passwordController,
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
          validator: events.checkPassword,
        );
      },
    );
  }
}
