import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants/color_constant.dart';

Widget floatingActionButtonWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 40.0),
    child: FloatingActionButton(
      heroTag: "btn1",
      onPressed: () {},
      backgroundColor: myPrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        //side: const BorderSide(width: 3, color: Colors.white),
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 2.0,
      child: const FaIcon(FontAwesomeIcons.houseMedical),
    ),
  );
}
