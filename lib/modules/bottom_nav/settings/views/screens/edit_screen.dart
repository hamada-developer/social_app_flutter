import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/cubit/edit_cubit.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/cubit/edit_state.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_circle_image.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_cover_image.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_name_bio.dart';
import 'package:social_app/style/icon_broken.dart';
import 'package:social_app/utils/widgets/default_text_fromfield.dart';
import 'package:social_app/utils/widgets/vertical_separated.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Text('update'.toUpperCase()),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// display user data
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Stack(
                  children: [
                    BlocBuilder<EditCubit, EditState>(
                      builder: (context, state) {
                        EditCubit cubit = EditCubit.get(context);
                        return Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            // TODO const BuildCoverImage(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                child: IconButton(
                                  onPressed: () {
                                    cubit.selectImageCover();
                                  },
                                  icon: const Icon(
                                    IconBroken.Camera,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        BlocBuilder<EditCubit, EditState>(
                          builder: (context, state) {
                            EditCubit cubit = EditCubit.get(context);
                            return Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                // TODO const BuildCircleImage(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 15,
                                  ),
                                  child: CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {
                                        cubit.selectImageProfile();
                                      },
                                      icon: const Icon(
                                        IconBroken.Camera,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const BuildNameBio(),
                      ],
                    ),
                  ],
                ),
              ),
              const DefaultTextFormField(
                labelText: 'Edit name',
                prefixIcon: Icon(IconBroken.User),
              ),
              const VerticalSeparated(),
              const DefaultTextFormField(
                labelText: 'Bio',
                prefixIcon: Icon(IconBroken.Add_User),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
