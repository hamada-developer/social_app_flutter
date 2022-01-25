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


  SettingsModels? _settingsModels;

  bool isEnable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEditScreen(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocBuilder<SettingsCubit, SettingsStates>(
            builder: (context, state) {
              var cubit = SettingsCubit.get(context);
              if (state is GetDataSettingSuccessfulState) {
                _settingsModels = state.settingsModels;
                cubit.nameController.text = _settingsModels!.name!;
                cubit.bioController.text = _settingsModels!.bio!;
                cubit.phoneController.text = _settingsModels!.phoneNumber!;
              }
              else if (state is SuccessUpdateData) {
                _settingsModels = state.settingsModels;
                cubit.nameController.text = _settingsModels!.name!;
                cubit.bioController.text = _settingsModels!.bio!;
                cubit.phoneController.text = _settingsModels!.phoneNumber!;
              }
              else if(state is NameUpdatingState){
                cubit.nameController = state.nameController;
              }
              else if(state is BioUpdatingState){
                cubit.bioController = state.bioController;
              }
              else if(state is PhoneUpdatingState){
                cubit.phoneController = state.phoneController;
              }
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
                    controller: cubit.nameController,
                    labelText: 'Name',
                    prefixIcon: const Icon(IconBroken.User),
                    onChanged: (value){
                      cubit.changeName();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextFormField(
                    controller: cubit.bioController,
                    labelText: 'Bio',
                    prefixIcon: const Icon(IconBroken.Info_Circle),
                      onChanged: (value){
                        cubit.changeBio();
                      },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextFormField(
                    controller: cubit.phoneController,
                    labelText: 'Phone',
                    prefixIcon: const Icon(IconBroken.Call),
                      onChanged: (value){
                        cubit.changePhone();
                      },
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
                var cubit = SettingsCubit.get(context);
                bool isEnabled = false;
                if(state is NameUpdatingState){
                  isEnabled = state.isEnabled;
                }
                if(state is BioUpdatingState){
                  isEnabled = state.isEnabled;
                }
                if(state is PhoneUpdatingState){
                  isEnabled = state.isEnabled;
                }
                if(state is CoverImageUpdatingState){
                  isEnabled = state.isEnabled;
                }
                if(state is ProfileImageUpdatingState){
                  isEnabled = state.isEnabled;
                }
                print('{}{}{}{----------> $isEnabled');
                return TextButton(
                  onPressed: isEnabled? () {
                    SettingsCubit.get(context).updateData(
                      bio: cubit.bioController.text,
                      name: cubit.nameController.text,
                      phone: cubit.phoneController.text,
                      context: context,
                    );
                  }: null,
                  child: Text('update'.toUpperCase()),
                );
              },
            ),
          ),
        ],
      );
}
