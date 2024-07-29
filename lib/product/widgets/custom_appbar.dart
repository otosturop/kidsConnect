import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:kidsconnect/feature/login/view/login_view.dart';

import '../../core/constants/color_constant.dart';

Widget customAppBar({
  required String title,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: context.sized.dynamicHeight(0.1),
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: Text(
              'ID: S8745',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: myTextBlackColor,
                  ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Hello, Albert R.',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF Pro Display',
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
    centerTitle: false,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0, top: 10),
        child: InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route) => false);
          },
          child: SvgPicture.asset(
            'assets/images/img_notification.svg',
            semanticsLabel: 'logout',
            height: context.sized.dynamicHeight(0.03),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 16.0, top: 5),
        child: InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route) => false);
          },
          child: CircleAvatar(
            radius: 28,
            child: Image.asset(
              'assets/images/4th_gruop.png',
              fit: BoxFit.contain,
              height: context.sized.dynamicHeight(0.08),
            ),
          ),
        ),
      ),
    ],
  );
}
