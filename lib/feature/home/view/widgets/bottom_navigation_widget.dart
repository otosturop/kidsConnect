import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/color_constant.dart';
import '../../../bottom_navigation/view/bottom_navigation_view.dart';

AnimatedBottomNavigationBar bottomNavigationBarWidget(BuildContext context, bottomBarNotifier) {
  return AnimatedBottomNavigationBar.builder(
    itemCount: bottomBarNotifier.items.length,
    tabBuilder: (int index, bool isActive) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            bottomBarNotifier.items[index].icon,
            size: 24,
            color: Colors.grey[800],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              bottomBarNotifier.items[index].name ?? '',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500],
              ),
            ),
          )
        ],
      );
    },
    activeIndex: bottomBarNotifier.selectedIndex,
    onTap: (index) {
      Navigator.pushNamed(context, BottomNavigationView.routeName);
      bottomBarNotifier.selectedIndex = index;
    },
    shadow: BoxShadow(
      offset: const Offset(0, 2),
      blurRadius: 15,
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
    borderWidth: 2,
    elevation: 5,
  );
}
