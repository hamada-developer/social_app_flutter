import 'package:flutter/material.dart';
import 'package:social_app/modules/bottom_nav/settings/models/models/settings_models.dart';
import 'package:social_app/modules/bottom_nav/settings/models/services/firestore/firestore_service.dart';
import 'package:social_app/modules/bottom_nav/settings/viewModels/settings_screen_view_model.dart';

class BuildNameBio extends StatelessWidget {
  const BuildNameBio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///dependency injection
     SettingsScreenViewModel viewModel = SettingsScreenViewModel(FirestoreService());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
          width: double.infinity,
        ),
        FutureBuilder<SettingsModels>(
          future: viewModel.getSettingData(),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.done)
              {
                return Text(
                  snapshot.data!.name,
                  style: Theme.of(context).textTheme.headline6,
                );
              }
            else{
              return Text(
                'No Name',
                style: Theme.of(context).textTheme.headline6,
              );
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<SettingsModels>(
          future: viewModel.getSettingData(),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.done)
            {
              return Text(
                snapshot.data!.bio,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 16,
                ),
              );
            }
            else{
              return Text(
                'No bio',
                style: Theme.of(context).textTheme.headline6,
              );
            }
          },
        ),
      ],
    );
  }
}
