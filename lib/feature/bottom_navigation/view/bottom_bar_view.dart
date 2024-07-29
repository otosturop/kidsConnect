import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/color_constant.dart';
import '../viewModel/bottom_navigation_view_model.dart';

class BottomNavigationView extends ConsumerWidget {
  const BottomNavigationView({super.key});
  static String routeName = 'BottomNavigationScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarNotifier = ref.watch(bottomBarProvider);
    return Scaffold(
      body: bottomBarNotifier.items[bottomBarNotifier.selectedIndex].widget,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFFEDF0F6),
            selectedIconTheme: const IconThemeData(color: myPrimaryColor),
            selectedItemColor: myPrimaryColor,
            unselectedItemColor: myContainerColor.withOpacity(0.8),
            onTap: (index) {
              bottomBarNotifier.selectedIndex = index;
            },
            currentIndex: bottomBarNotifier.selectedIndex,
            items: bottomBarNotifier.items
                .map((e) => BottomNavigationBarItem(
                      icon: Icon(e.icon),
                      label: e.name,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
