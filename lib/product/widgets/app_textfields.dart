import 'package:flutter/material.dart';

import '../../core/constants/color_constant.dart';

Widget appTextField({
  required BuildContext context,
  required String text,
  required IconData icon,
  required String hintText,
  bool isPassword = false,
  bool isVisible = false,
  required void Function(String value) onChangedInput,
  void Function()? visibilityPassword,
}) {
  return Container(
    padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 5),
        TextField(
          onChanged: (value) => onChangedInput(value),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            prefixIcon: Icon(
              icon,
              color: myPrimaryColor,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(isVisible ? Icons.remove_red_eye_outlined : Icons.visibility_off),
                    color: myPrimaryColor,
                    onPressed: visibilityPassword,
                  )
                : null,
          ),
          maxLines: 1,
          obscureText: isPassword ? isVisible : false,
        )
      ],
    ),
  );
}
