import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../../../core/constants/color_constant.dart';
import '../../home/view/home_view.dart';
import '../viewModel/bottom_navigation_view_model.dart';

class BottomNavigationView extends ConsumerWidget {
  const BottomNavigationView({super.key});
  static String routeName = 'BottomNavigationScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarNotifier = ref.watch(bottomBarProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: bottomBarNotifier.items[bottomBarNotifier.selectedIndex].widget,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: FloatingActionButton(
          onPressed: () {
            //bottomBarNotifier.selectedIndex = 5;
            Navigator.pushNamed(context, HomeView.routeName);
          },
          backgroundColor: Colors.white,
          foregroundColor: myPrimaryColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 3, color: myPrimaryColor),
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 2.0,
          child: const FaIcon(FontAwesomeIcons.houseMedical),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: bottomBarNotifier.items.length,
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                bottomBarNotifier.items[index].icon,
                size: 24,
                color: isActive ? myPrimaryColor : Colors.grey[800],
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  bottomBarNotifier.items[index].name ?? '',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isActive ? myPrimaryColor : Colors.grey[500],
                  ),
                ),
              )
            ],
          );
        },
        activeIndex: bottomBarNotifier.selectedIndex,
        onTap: (index) {
          bottomBarNotifier.selectedIndex = index;
        },
        shadow: BoxShadow(
          offset: const Offset(0, 2),
          blurRadius: 10,
          color: Colors.grey.shade700,
        ),
        backgroundColor: myOnSecondaryColor,
        gapLocation: GapLocation.center,
        splashRadius: 40,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        notchMargin: 28,
        height: context.sized.dynamicHeight(0.1),
        splashColor: myPrimaryColor,
        notchSmoothness: NotchSmoothness.defaultEdge,
        borderColor: Colors.grey[700],
        borderWidth: 0,
        elevation: 5,
      ),
    );
  }
}
