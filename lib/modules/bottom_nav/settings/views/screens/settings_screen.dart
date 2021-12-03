import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/modules/bottom_nav/settings/views/screens/edit_screen.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_cover.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_name_bio.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_profile.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_statistics.dart';
import 'package:social_app/style/icon_broken.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
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
                    isEditing: false,
                  ),
                  BuildProfile(
                    isEditing: false,
                  ),
                ],
              ),
            ),
            const BuildNameBio(),
            const SizedBox(
              height: 20,
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
                    goToEditScreen(context);
                  },
                  child: const Icon(IconBroken.Edit),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void goToEditScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return const EditScreen();
    }));
  }
}
