import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kidsconnect/feature/announcements/model/announcement_model.dart';
import 'package:kidsconnect/feature/announcements/service/announcement_service.dart';

import '../../../product/services/project_service.dart';
import '../model/announcement_type_model.dart';

class AnnouncementsViewModel with ChangeNotifier, ProjectService {
  IAnnouncementService announcementService;
  String? _title;
  String? _description;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<AnnouncementType> announcementType = [];
  AnnouncementType? selectedAnnouncementType;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<AnnouncementDummy> announcements = [];

  AnnouncementsViewModel(ref, this.announcementService) {
    initDio(ref);
    fetchAnnouncements();
    fetchAndAddAnnouncementsType();
  }

  void changeAnnouncementType(AnnouncementType type) {
    selectedAnnouncementType = type;
    notifyListeners();
  }

  void removeAnnouncementFromList(int index) {
    announcements.removeAt(index);
    notifyListeners();
  }

  List<String> splitDate(String myDate) {
    return myDate.split(' ');
  }

  void fetchAndAddAnnouncementsType() async {
    AnnouncementTypeModel? response = await announcementService.getAnnouncementTypes();
    if (response != null) {
      response.payload?.forEach((data) {
        announcementType.add(AnnouncementType(
          id: data.announcementTypeId ?? 0,
          name: data.name ?? '-',
        ));
      });
    }
    notifyListeners();
  }

  set setTitle(value) => _title = value;
  set setDescription(value) => _description = value;

  void fetchAnnouncements() async {
    _setLoading(true);
    AnnouncementModel? response = await announcementService.getAnnouncements('2');
    if (response != null) {
      announcements = [];
      response.payload?.forEach((data) {
        announcements.add(
          AnnouncementDummy(
              guid: data.guid ?? '-',
              title: data.title ?? '-',
              description: data.description ?? '-',
              announcementType: data.announcementTypeId ?? 0,
              publisher: 'Admin',
              publishDate: '15.30 30.08.2024'),
        );
      });
    }
    _setLoading(false);
    notifyListeners();
  }

  Future<bool> removeAnnouncement(String guid) async {
    bool result = false;
    result = await announcementService.deleteAnnouncement(guid);
    return result;
  }

  Future<bool> saveAnnouncement() async {
    bool result = false;
    if (_title != null && _description != null && selectedAnnouncementType != null) {
      result = await announcementService.addAnnouncement(_title!, _description!, selectedAnnouncementType!.id);
    }
    return result;
  }

  Future<bool> updateAnnouncement(String guid) async {
    bool result = false;
    if (_title != null && _description != null && selectedAnnouncementType != null) {
      result = await announcementService.editAnnouncement(
        guid,
        _title!,
        _description!,
        selectedAnnouncementType!.id,
        2,
      );
    }
    return result;
  }

  void findAnnouncementTypeById(int id) {
    debugPrint("typeId : $id");
    selectedAnnouncementType = announcementType.firstWhere(
      (announcementType) => announcementType.id == id,
    );
  }
}

final announcementViewModelProvider = ChangeNotifierProvider((ref) {
  final announcementService = ref.read(announcementServiceProvider);
  return AnnouncementsViewModel(ref, announcementService);
});

class AnnouncementDummy {
  String guid;
  String title;
  String description;
  int announcementType;
  String publisher;
  String publishDate;
  AnnouncementDummy({
    required this.guid,
    required this.title,
    required this.description,
    required this.announcementType,
    required this.publisher,
    required this.publishDate,
  });
}

class AnnouncementType {
  int id;
  String name;
  AnnouncementType({
    required this.id,
    required this.name,
  });
}
