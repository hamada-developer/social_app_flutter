import 'package:flutter/material.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/models/services/firestore/firestore_service.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/settings_screen_view_model.dart';

class BuildCoverImage extends StatelessWidget {
  const BuildCoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* dependency injection*/
    SettingsScreenViewModel screenViewModel =
        SettingsScreenViewModel(FirestoreService());
    screenViewModel.getUrlImageCover();
    return FutureBuilder<SettingsModels>(
      future: screenViewModel.getUrlImageCover(),
      builder: (BuildContext context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          print('connection state done = ');
          return Container(
            width: double.infinity,
            height: 280 / 2,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(15),
                topEnd: Radius.circular(15),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  snap.data!.urlImageCover,
                ),
              ),
            ),
          );
        } else {
          return Container(
            width: double.infinity,
            height: 280 / 2,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(15),
                topEnd: Radius.circular(15),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.ctfassets.net/hrltx12pl8hq/4plHDVeTkWuFMihxQnzBSb/aea2f06d675c3d710d095306e377382f/shutterstock_554314555_copy.jpg',
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
