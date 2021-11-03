import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/viewModel/layout_view_model/cubit/layout_cubit.dart';
import 'package:social_app/layout/viewModel/layout_view_model/cubit/layout_state.dart';

import 'items_bottom_nav.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutCubit layoutCubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return BottomNavigationBar(
          items: ItemsBottomNav.itemsBottomNav,
          currentIndex: layoutCubit.currentIndex,
          onTap: (index){
            print('index= $index');
            layoutCubit.changeBottomNav(index);
          },
        );
      },
    );
  }
}

