import 'package:flutter/material.dart';

class BuildCircleImage extends StatelessWidget {
  const BuildCircleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const CircleAvatar(
          radius: 55,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
            'https://cdn-icons-png.flaticon.com/512/709/709722.png',
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 5),
        ),
      ),
    );
  }
}
