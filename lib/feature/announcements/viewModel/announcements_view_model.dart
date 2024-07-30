// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kidsconnect/feature/announcements/service/announcement_service.dart';

import '../../../product/services/project_service.dart';

class AnnouncementsViewModel with ChangeNotifier, ProjectService {
  IAnnouncementService announcementService;

  List<AnnouncementDummy> announcements = [];

  AnnouncementsViewModel(ref, this.announcementService) {
    initDio(ref);
    fetchAnnouncements();
  }

  void fetchAnnouncements() {
    announcements.add(
      AnnouncementDummy(
          title: 'Görevler',
          description: 'Haydi Beyler acele edelim servisleri yetiştirelim',
          publisher: 'Burak Coşkun',
          publishDate: '15.30 30.08.2024'),
    );
    announcements.add(
      AnnouncementDummy(
          title: 'Görevler',
          description: 'İş İş İş bııktık ya para, paraa yook',
          publisher: 'Mahmut Türkan',
          publishDate: '15.31 30.08.2024'),
    );
    announcements.add(
      AnnouncementDummy(
          title: 'Görevler',
          description: 'Keycloak tamamda şu Sunucu işlerini bir anlatmadınız',
          publisher: 'Ahmet Orbay',
          publishDate: '15.32 30.08.2024'),
    );
    announcements.add(
      AnnouncementDummy(
          title: 'Yapılacaklar',
          description: 'O Değilde Bence Buton Pemmbee olsun',
          publisher: 'Mehmet Arıkan',
          publishDate: '15.33 30.08.2024'),
    );
    notifyListeners();
  }
}

final announcementViewModelProvider = ChangeNotifierProvider((ref) {
  final announcementService = ref.read(announcementServiceProvider);
  return AnnouncementsViewModel(ref, announcementService);
});

class AnnouncementDummy {
  String title;
  String description;
  String publisher;
  String publishDate;
  AnnouncementDummy({
    required this.title,
    required this.description,
    required this.publisher,
    required this.publishDate,
  });
}
