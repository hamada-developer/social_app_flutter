import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateWithData({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ),
  );
}
