import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_cubit.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/setttings_cubit/settings_states.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_cover.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_profile.dart';
import 'package:social_app/style/icon_broken.dart';
import 'package:social_app/utils/widgets/default_text_fromfield.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  SettingsModels? _settingsModels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEditScreen(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocBuilder<SettingsCubit, SettingsStates>(
            builder: (context, state) {
              if (state is GetDataSettingSuccessfulState) {
                _settingsModels = state.settingsModels;
              }
              else if (state is SuccessUpdateData) {
                _settingsModels = state.settingsModels;
              }
              else if (state is SuccessUpdateData) {
                _settingsModels = state.settingsModels;
              }

              nameController.text = (_settingsModels != null
                  ? _settingsModels!.name
                  : 'waiting')!;

              bioController.text = (_settingsModels != null
                  ? _settingsModels!.bio
                  : 'waiting')!;

              phoneController.text = (_settingsModels != null
                  ? _settingsModels!.phoneNumber
                  : 'waiting')!;
              return Column(
                children: [
                  /// display Cover and Profile
                  Container(
                    height: 250,
                    color: Colors.white,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: const [
                        // Build Cover
                        BuildCover(
                          isEditing: true,
                        ),
                        BuildProfile(
                          isEditing: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextFormField(
                    controller: nameController,
                    labelText: 'Name',
                    prefixIcon: const Icon(IconBroken.User),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextFormField(
                    controller: bioController,
                    labelText: 'Bio',
                    prefixIcon: const Icon(IconBroken.Info_Circle),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextFormField(
                    controller: phoneController,
                    labelText: 'Phone',
                    prefixIcon: const Icon(IconBroken.Call),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// *appBar
  PreferredSizeWidget appBarEditScreen() => AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<SettingsCubit, SettingsStates>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    SettingsCubit.get(context).updateData(
                      bio: bioController.text,
                      name: nameController.text,
                      phone: phoneController.text,
                      context: context,
                    );
                  },
                  child: Text('update'.toUpperCase()),
                );
              },
            ),
          ),
        ],
      );
}
