import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/cubit/register_cubit.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/cubit/register_states.dart';
import 'package:social_app/modules/auth/viewModels/register_screen_view_model/events/register_event.dart';
import 'package:social_app/utils/widgets/default_button.dart';
import 'package:social_app/utils/navigations.dart';
import 'package:social_app/utils/widgets/default_circle_laoding.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterCubit cubit = RegisterCubit.get(context);
    final RegisterEvents event = RegisterEvents();
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is SuccessRegisterState) {
          navigateToAndFinish(context: context, newRouteName: AppStrings.appLayoutScreen);
        }
        else if (state is ErrorRegisterState) {
          event.showToast(state.error.toString());
        }
      },
      builder: (context, state) {
        return state is! LoadingRegisterState ?
        DefaultButton(
          text: AppStrings.registerButton,
          onPressed: () {
            cubit.loginButton();
          },
        ):
        const DefaultCircleLoading();
      },
    );
  }
}
