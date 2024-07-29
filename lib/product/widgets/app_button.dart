import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/color_constant.dart';

Widget appButton({
  required BuildContext context,
  required String buttonText,
  required IconData icon,
  required Future<void> Function() onClicked,
}) {
  return InkWell(
    onTap: onClicked,
    child: Container(
      width: context.sized.dynamicWidth(0.8),
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [myPrimaryColor, myPrimaryContainer],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            buttonText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: myOtherColor,
                ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              icon,
              size: 30,
              color: myOtherColor,
            ),
          )
        ],
      ),
    ),
  );
}
