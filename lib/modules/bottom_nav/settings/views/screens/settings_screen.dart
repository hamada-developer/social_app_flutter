import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/cubit/edit_cubit.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_circle_image.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_cover_image.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_name_bio.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_statistics.dart';
import 'package:social_app/style/icon_broken.dart';
import 'package:social_app/utils/navigations.dart';
import 'package:social_app/utils/widgets/navigate_with_data.dart';

import 'edit_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> EditCubit(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /// display user data
            SizedBox(
              height: 280,
              width: double.infinity,
              child: Stack(
                children: [
                   BuildCoverImage(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 40,
                      ),
                      // TODO BuildCircleImage(),
                      BuildNameBio(),
                    ],
                  ),
                ],
              ),
            ),
            /// display statistics
            Row(
              children: const [
                /// posts
                Expanded(
                  child: BuildStatistics(
                    title: 'Posts',
                    counter: 100,
                  ),
                ),

                /// photos
                Expanded(
                  child: BuildStatistics(
                    title: 'Posts',
                    counter: 336,
                  ),
                ),

                /// followers
                Expanded(
                  child: BuildStatistics(
                    title: 'Followers',
                    counter: 250,
                  ),
                ),

                /// Followings
                Expanded(
                  child: BuildStatistics(
                    title: 'Followings',
                    counter: 64,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            /// editing
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Add Photos'),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                OutlinedButton(
                  onPressed: () {
                    navigateWithData(
                      context: context,
                      widget: const EditScreen(),
                    );
                  },
                  child: const Icon(IconBroken.Edit),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
