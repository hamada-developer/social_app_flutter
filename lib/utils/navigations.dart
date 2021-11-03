import 'package:flutter/material.dart' show BuildContext, Navigator;

navigateTo({required BuildContext context, required String route}) =>
    Navigator.pushNamed(context, route);

navigateToAndFinish(
    {required BuildContext context, required String newRouteName}) =>
    Navigator.pushNamedAndRemoveUntil(context, newRouteName, (route) => false);

navigateToBack({required BuildContext context}) => Navigator.pop(context);
