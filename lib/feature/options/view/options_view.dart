import 'package:flutter/material.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/color_constant.dart';
import '../../../product/widgets/custom_appbar.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key});
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBasicBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appbarHeight),
        child: customAppBar(context: context, title: "Seçenekler"),
      ),
    );
  }
}
