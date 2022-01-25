import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/bottom_nav/post/viewModel/cubit/add_post_cubit.dart';
import 'package:social_app/modules/bottom_nav/post/viewModel/cubit/add_post_states.dart';
import 'package:social_app/style/colors/app_colors.dart';
import 'package:social_app/style/icon_broken.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  late double height;
  late double width;
  TextEditingController postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AddPostCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Create post'),
              actions: [
                TextButton(onPressed: () {}, child: const Text('POST')),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300',
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Hamada Mohamed',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  _buildPostBox(cubit),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text('add photo'),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(IconBroken.Image,),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('# tags'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostBox(cubit) => Expanded(
        child: TextFormField(
          controller: postController,
          maxLines: 50,
          decoration: const InputDecoration(
            hintText: 'what is on your mind...',
            border: InputBorder.none,
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
    postController.dispose();
  }
}
