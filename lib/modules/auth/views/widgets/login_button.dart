import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_cubit.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/cubit/login_states.dart';
import 'package:social_app/modules/auth/viewModels/login_screen_view_model/events/login_events.dart';
import 'package:social_app/utils/navigations.dart';
import 'package:social_app/utils/widgets/default_button.dart';
import 'package:social_app/utils/widgets/default_circle_laoding.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = LoginCubit.get(context);
    final LoginEvents events = LoginEvents();
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          navigateToAndFinish(
              context: context, newRouteName: AppStrings.appLayoutScreen);
        }
        else if (state is ErrorLoginState) {
          events.showToast(
            state.error.toString(),
          );
        }
      },
      builder: (context, state) {
        return state is! LoadingLoginState
            ? DefaultButton(
                text: AppStrings.loginButton,
                onPressed: cubit.loginButton,
              )
            : const DefaultCircleLoading();
      },
    );
  }
}
