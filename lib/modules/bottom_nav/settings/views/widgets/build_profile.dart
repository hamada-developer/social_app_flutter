import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_cubit.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_states.dart';
import 'package:social_app/style/icon_broken.dart';

class BuildProfile extends StatefulWidget {
  final bool isEditing;

  const BuildProfile({Key? key, required this.isEditing}) : super(key: key);

  @override
  _BuildProfileState createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  SettingsModels? _settingsModels;
  XFile? _xFile;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsStates>(
      builder: (context, state) {
        if(state is GetDataSettingSuccessfulState){
          _settingsModels = state.settingsModels;
        }
        else if(state is SelectProfileImageState){
         _xFile = state.xFile;
        }
        else if(state is SuccessUpdateData){
          _settingsModels = state.settingsModels;
        }
        return widget.isEditing ? _buildProfileEditScreen() : _buildProfileSettingScreen();
      },
    );
  }

  ImageProvider _setDefaultProfile() {
    return const AssetImage('assets/images/place_holder.png');
  }

  ImageProvider _setProfile(SettingsModels model) {
    return NetworkImage(
      model.urlImageProfile.toString(),
    );
  }

  Widget _buildProfileEditScreen() => Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
              image: _xFile == null
                  ?
                  /// * display from fireStore
                  DecorationImage(
                      image: _settingsModels != null
                          ? _setProfile(_settingsModels!)
                          : _setDefaultProfile(),
                      fit: BoxFit.cover,
                    )
                  :
                  /// * display from File
                  DecorationImage(
                      image: FileImage(
                        File(_xFile!.path),
                      ),
                      fit: BoxFit.cover,
                    ),
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              child: IconButton(
                onPressed: SettingsCubit.get(context).selectImageForProfile,
                icon: const Icon(
                  IconBroken.Camera,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildProfileSettingScreen() => Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
          image: DecorationImage(
            image: _settingsModels != null
                ? _setProfile(_settingsModels!)
                : _setDefaultProfile(),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
        ),
      );
}
