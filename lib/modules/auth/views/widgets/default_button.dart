import 'package:flutter/material.dart';
import 'package:social_app/constants/app_padding.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 48.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.defaultHorizontal,
      ),
      minWidth: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
