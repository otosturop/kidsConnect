import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../viewModel/splash_view_model.dart';
import '../../../core/utils/loading/box_rotation.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});
  static String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashNotifier = ref.watch(splashProvider);
    splashNotifier.checkLogin(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: context.sized.dynamicHeight(0.25),
                bottom: context.sized.dynamicHeight(0.1),
              ),
              child: const SizedBox(
                child: BoxRotation(),
              ),
            ),
            SizedBox(
              height: context.sized.dynamicHeight(0.1),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Kids Connect',
                    textStyle: GoogleFonts.pattaya(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: const Color(0xFF867AE9),
                    ),
                    speed: const Duration(milliseconds: 80),
                  ),
                ],
                displayFullTextOnTap: true,
                repeatForever: true,
              ),
            ),
            SizedBox(
                height: context.sized.dynamicHeight(0.2),
                child: DefaultTextStyle(
                  style: GoogleFonts.pattaya(
                    fontSize: 28.0,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF867AE9),
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 0),
                    displayFullTextOnTap: true,
                    animatedTexts: [
                      RotateAnimatedText(
                        'Anaokulu',
                        duration: const Duration(milliseconds: 1300),
                        textStyle: GoogleFonts.pattaya(color: const Color(0xFF00B8A9)),
                      ),
                      RotateAnimatedText(
                        'Takip',
                        duration: const Duration(milliseconds: 1300),
                        textStyle: GoogleFonts.pattaya(color: const Color(0xFFFFCB77)),
                      ),
                      RotateAnimatedText(
                        'Sistemi',
                        duration: const Duration(milliseconds: 1300),
                        textStyle: GoogleFonts.pattaya(color: const Color(0xFFFE6D73)),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
