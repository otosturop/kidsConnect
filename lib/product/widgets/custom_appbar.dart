import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kidsconnect/feature/login/view/login_view.dart';

Widget customAppBar({
  required String title,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: context.sized.dynamicHeight(0.8),
    automaticallyImplyLeading: false,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.transparent,
        child: Image.asset(
          'assets/images/4th_gruop.png',
          fit: BoxFit.contain,
          height: context.sized.dynamicHeight(0.06),
        ),
      ),
    ),
    title: const Text(
      'Merhaba, Mehmet Arıkan',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'SF Pro Display',
        color: Colors.black87,
      ),
    ),
    centerTitle: false,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route) => false);
          },
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/images/9th_gruop.png',
              fit: BoxFit.contain,
              height: context.sized.dynamicHeight(0.06),
            ),
          ),
        ),
      ),
    ],
  );
}
