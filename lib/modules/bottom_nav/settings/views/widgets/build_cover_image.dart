import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/models/services/firestore/firestore_service.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/cubit/edit_cubit.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/cubit/edit_state.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/settings_screen_view_model.dart';
import 'package:social_app/utils/widgets/toast.dart';

class BuildCoverImage extends StatelessWidget {

  const BuildCoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsScreenViewModel screenViewModel =
    SettingsScreenViewModel(FirestoreService());
    return Container(
      width: double.infinity,
      height: 280 / 2,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(15),
          topEnd: Radius.circular(15),
        ),
      ),
      child: FutureBuilder<SettingsModels>(
        future: screenViewModel.getSettingData(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
            );
          } else {
            return BlocBuilder<EditCubit, EditState>(
              builder: (context, state) {
                EditCubit cubit = EditCubit.get(context);
                return cubit.fileImageCo.path.contains('')?
                    Container(child: Text('true'),):Container(child: Text('false'),);
              },
            );
          }
        },
      ),
    );
  }

}
