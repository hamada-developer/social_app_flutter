import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/models/services/firestore/firestore_service.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/settings_screen_view_model.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_cubit.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_states.dart';

class BuildNameBio extends StatefulWidget {
  const BuildNameBio({Key? key}) : super(key: key);

  @override
  State<BuildNameBio> createState() => _BuildNameBioState();
}

class _BuildNameBioState extends State<BuildNameBio> {

  SettingsModels? _settingsModels;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
          width: double.infinity,
        ),
        BlocBuilder<SettingsCubit , SettingsStates>(
          builder: (context, state){
            if(state is GetDataSettingSuccessfulState){
              _settingsModels = state.settingsModels;
            }
            else if(state is SuccessUpdateData){
              _settingsModels = state.settingsModels;
            }
            return _settingsModels != null ? Text(
              _settingsModels!.name.toString(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ): Text(
              'No Name',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<SettingsCubit, SettingsStates>(
          builder: (context, state){
            return  _settingsModels != null ? Text(
              _settingsModels!.bio.toString(),
              style: Theme.of(context).textTheme.headline6,
            ): Text(
              'No bio',
              style: Theme.of(context).textTheme.headline6,
            );
          },
        ),
      ],
    );
  }
}
