import 'package:flutter/material.dart';
import '../../feature/announcements/view/edit_announcement_view.dart';
import '../../feature/login/view/login_view.dart';

class EditAnnouncementViewArguments {
  final String guid;
  final String announcementTypeId;
  final String title;
  final String description;

  EditAnnouncementViewArguments({
    required this.guid,
    required this.announcementTypeId,
    required this.title,
    required this.description,
  });
}

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name == 'EditAnnouncementScreen') {
    final args = settings.arguments as EditAnnouncementViewArguments;
    return MaterialPageRoute(
      builder: (context) {
        return EditAnnouncementView(
          guid: args.guid,
          announcementTypeId: args.announcementTypeId,
          title: args.title,
          description: args.description,
        );
      },
    );
  }

  // Eğer rotayı bulamazsa default route'a yönlendirme
  return MaterialPageRoute(builder: (context) => const LoginView());
}
