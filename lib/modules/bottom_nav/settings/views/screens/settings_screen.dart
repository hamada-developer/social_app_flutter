import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/style/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          /// display user data
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Stack(
              children: [
                _buildCover(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    _buildCircleImage(),
                    _buildUserNameAndBio(context),
                  ],
                ),
              ],
            ),
          ),
          /// display counters
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '100',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Posts'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '100',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Posts'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '100',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Posts'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '100',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('Posts'),
                  ],
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
                onPressed: () {},
                child: const Icon(IconBroken.Edit),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCover(){
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
              'https://images.freeimages.com/images/large-previews/1e7/japanese-food-1327425.jpg',
            ),
          )),
    );
  }

  Widget _buildCircleImage(){
    return Center(
      child: Container(
        child: const CircleAvatar(
          radius: 55,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1507591064344-4c6ce005b128?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 5),
        ),
      ),
    );
  }

  Widget _buildUserNameAndBio(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
          width: double.infinity,
        ),
        Text(
          'Hamada Mohamed',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'write you bio',
          style: Theme.of(context).textTheme.caption!.copyWith(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
