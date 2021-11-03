import 'package:flutter/material.dart';
import 'package:social_app/constants/app_padding.dart';

class HorizontalSeparated extends StatelessWidget {
  const HorizontalSeparated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppPadding.defaultHorizontal,
    );
  }
}
