import 'package:flutter/material.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_circle_image.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_cover_image.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_name_bio.dart';
import 'package:social_app/utils/widgets/default_text_fromfield.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  const BuildCoverImage(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 40,
                      ),
                      BuildCircleImage(),
                      BuildNameBio(),
                    ],
                  ),
                ],
              ),
            ),
            const DefaultTextFormField(
              labelText: 'Edit name',
            ),
          ],
        ),
      ),
    );
  }
}
