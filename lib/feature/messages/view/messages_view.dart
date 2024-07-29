import 'package:flutter/material.dart';

import '../../../core/constants/app_constant.dart';
import '../../../product/widgets/custom_appbar.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});
  static String routeName = 'MessageScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appbarHeight),
        child: customAppBar(context: context, title: "Mesajlar"),
      ),
    );
  }
}
