import 'package:flutter/material.dart';

class DefaultCircleLoading extends StatelessWidget {
  const DefaultCircleLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
