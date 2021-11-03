import 'package:flutter/material.dart';
import 'package:social_app/constants/app_padding.dart';
import 'package:social_app/constants/app_strings.dart';
import 'package:social_app/layout/viewModel/layout_view_model/function/layout_fun.dart';

class HintVerify extends StatelessWidget {
  const HintVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LayoutFun function = LayoutFun();
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.06,
      color: Colors.amberAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.defaultHorizontal,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              AppStrings.hintVerify,
            ),
            const Spacer(),
            TextButton(
              onPressed: function.sendEmailVerification,
              child: Text(
                AppStrings.hintSend.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
