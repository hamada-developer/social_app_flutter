import 'package:flutter/material.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_cover_image.dart';
import 'package:social_app/modules/bottom_nav/settings/views/widgets/build_name_bio.dart';
import 'package:social_app/style/icon_broken.dart';
import 'package:social_app/utils/widgets/default_text_fromfield.dart';
import 'package:social_app/utils/widgets/vertical_separated.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text('from windows 10'.toUpperCase()),
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
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      const BuildCoverImage(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              IconBroken.Camera,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Container(
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              const CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/709/709722.png',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      IconBroken.Camera,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                        ),
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
    );
  }
}
