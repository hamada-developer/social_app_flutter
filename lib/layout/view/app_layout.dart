import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/layout/view/widgets/navigation_bar_widget.dart';
import 'package:social_app/layout/viewModel/layout_view_model/cubit/layout_cubit.dart';
import 'package:social_app/layout/viewModel/layout_view_model/cubit/layout_state.dart';
import 'package:social_app/layout/viewModel/layout_view_model/function/layout_fun.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_cubit.dart';
import 'package:social_app/style/icon_broken.dart';
import 'package:social_app/utils/navigations.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if(state is AddPostState){
          navigateTo(
            context: context,
            route: AppStrings.addPostScreen,
          );
        }
      },
      builder: (context, state) {
        LayoutFun layoutFun = LayoutFun();
        LayoutCubit layoutCubit = LayoutCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              layoutCubit.titles[layoutCubit.currentIndex],
            ),
            actions: [
              IconButton(
                onPressed: (){
                  layoutFun.notificationButton(context);
                },
                icon: const Icon(
                  IconBroken.Notification,
                ),
              ),
              IconButton(
                onPressed: () {
                  layoutFun.searchButton(context);
                },
                icon: const Icon(
                  IconBroken.Search,
                ),
              ),
            ],
          ),
          body: layoutCubit.screen[layoutCubit.currentIndex],
          bottomNavigationBar: const NavigationBarWidget(),
        );
      },
    );
  }
}