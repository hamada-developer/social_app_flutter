import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_cubit.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_states.dart';
import 'package:social_app/style/icon_broken.dart';

class BuildCover extends StatefulWidget {
  final bool isEditing;

  const BuildCover({Key? key, required this.isEditing}) : super(key: key);

  @override
  State<BuildCover> createState() => _BuildCoverState();
}

class _BuildCoverState extends State<BuildCover> {
  SettingsModels? _settingsModels;
  XFile? coverFile;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsStates>(
      builder: (context, state) {

        if (state is GetDataSettingSuccessfulState) {
          _settingsModels = state.settingsModels;
        }
        else if (state is SuccessSelectImageForCover) {
          coverFile = state.xFile;
        }
        else if(state is SuccessUpdateData){
          _settingsModels = state.settingsModels;
        }
        return widget.isEditing ? _buildCEditCover() : _buildSettingCover();
      },
    );
  }

  // build AssetImage
  ImageProvider _serDefaultCover() {
    return const AssetImage('assets/images/default_cover.jpeg');
  }

  // build NetworkImage
  ImageProvider _setCover(SettingsModels models) {
    return NetworkImage(
      models.urlImageCover.toString(),
    );
  }

  Widget _buildCEditCover() => Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: coverFile == null
                      ? DecorationImage(
                          image: _settingsModels != null
                              ? _setCover(_settingsModels!)
                              : _serDefaultCover(),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: FileImage(
                            File(coverFile!.path),
                          ),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CircleAvatar(
                  child: BlocBuilder<SettingsCubit, SettingsStates>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed:
                            SettingsCubit.get(context).selectImageForCover,
                        icon: const Icon(
                          IconBroken.Camera,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildSettingCover() => Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: _settingsModels != null
                    ? _setCover(_settingsModels!)
                    : _serDefaultCover(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      );
}
