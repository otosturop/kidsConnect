import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../media/view/media_view.dart';
import '../../messages/view/messages_view.dart';
import '../../announcements/view/announcements_view.dart';
import '../../options/view/options_view.dart';

class BottomBarViewModel with ChangeNotifier {
  int _selectedIndex = 2;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  final List<NavbarComponent> _items = [
    NavbarComponent(
      name: "Duyurular",
      icon: FontAwesomeIcons.bullhorn,
      widget: const AnnouncementsView(),
    ),
    NavbarComponent(
      name: "Medya",
      icon: FontAwesomeIcons.photoFilm,
      widget: const MediaView(),
    ),
    NavbarComponent(
      name: "Mesajlar",
      icon: FontAwesomeIcons.solidCommentDots,
      widget: const MessagesView(),
    ),
    NavbarComponent(
      name: "Seçenekler",
      icon: FontAwesomeIcons.briefcase,
      widget: const OptionsView(),
    ),
  ];

  List<NavbarComponent> get items => _items;
}

final bottomBarProvider = ChangeNotifierProvider((ref) => BottomBarViewModel());

class NavbarComponent {
  String? name;
  IconData? icon;
  Widget widget;
  NavbarComponent({
    required this.name,
    required this.icon,
    required this.widget,
  });
}
