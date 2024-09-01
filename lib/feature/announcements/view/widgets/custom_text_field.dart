import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/color_constant.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isObscureText;
  final String obscureCharacter;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int fieldMaxLines;
  final int fieldMinLines;
  final void Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscureCharacter = '*',
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.fieldMaxLines = 1,
    this.fieldMinLines = 1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: fieldMaxLines == 1 ? context.sized.dynamicHeight(0.08) : context.sized.dynamicHeight(0.15),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isObscureText,
          obscuringCharacter: obscureCharacter,
          minLines: fieldMinLines,
          maxLines: fieldMaxLines,
          onChanged: onChanged,
          style: GoogleFonts.urbanist(
            color: myTextBlackColor,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 12.0),
            constraints: BoxConstraints(
              maxHeight: context.sized.dynamicHeight(0.065),
              maxWidth: context.sized.dynamicWidth(0.9),
            ),
            filled: true,
            fillColor: myOtherColor,
            hintText: hintText,
            hintStyle: GoogleFonts.urbanist(
              color: mySurface,
              fontSize: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12.0),
              child: prefixIcon,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: mySurface,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: mySurface,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: mySurface,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
