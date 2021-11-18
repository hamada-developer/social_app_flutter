import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/models/services/firestore/firestore_service.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/cubit/edit_cubit.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/cubit/edit_state.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/settings_screen_view_model.dart';

class BuildCircleImage extends StatelessWidget {
  const BuildCircleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SettingsScreenViewModel viewModel = SettingsScreenViewModel(FirestoreService());
    return Container(
      child: FutureBuilder<SettingsModels>(
        future: viewModel.getSettingData(),
        builder: (context, data) {
          if(data.connectionState == ConnectionState.waiting){
            return  CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              child: SvgPicture.asset('assets/images/loading_animation.svg'),
            );
          }
          else{
            return BlocBuilder<EditCubit , EditState>(
              builder: (context, state){
                EditCubit cubit = EditCubit.get(context);
                  return cubit.fileImageProfile != null?  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    backgroundImage:
                    FileImage(cubit.fileImageProfile),
                  ):
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(data.data!.urlImageProfile),
                  );
              }
            );
          }
        },
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 5),
      ),
    );
  }
}
