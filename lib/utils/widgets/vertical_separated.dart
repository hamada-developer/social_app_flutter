import 'package:flutter/material.dart';
import 'package:social_app/constants/app_padding.dart';

class VerticalSeparated extends StatelessWidget {
  const VerticalSeparated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppPadding.defaultVertical,
    );
  }
}
