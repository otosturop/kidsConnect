import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../product/services/dio_provider.dart';
import '../model/announcement_model.dart';
import '../model/announcement_type_model.dart';

abstract class IAnnouncementService {
  final Dio dio;

  IAnnouncementService(this.dio);
  Future<AnnouncementModel?> getAnnouncements(String schoolId);
  Future<bool> addAnnouncement(String title, String description, int announcementType);
  Future<AnnouncementTypeModel?> getAnnouncementTypes();
  Future<bool> deleteAnnouncement(String guid);
  Future<bool> editAnnouncement(
    String guid,
    String title,
    String description,
    int announcementTypeId,
    int schoolId,
  );
}

class AnnouncementService extends IAnnouncementService {
  AnnouncementService(super.dio);

  @override
  Future<AnnouncementModel?> getAnnouncements(String schoolId) async {
    try {
      final response = await dio.get('Announcement/GetAnnouncementBySchoolId?SchoolId=$schoolId');
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return AnnouncementModel.fromJson(jsonBody);
        }
      }
    } on DioException catch (error) {
      if (kDebugMode) {
        print("Dio Announcements Type error: $error");
      }
    }
    return null;
  }

  @override
  Future<bool> addAnnouncement(String title, String description, int announcementType) async {
    Object postData = json.encode({
      'announcementTypeId': announcementType,
      'schoolId': 2,
      'title': title,
      'description': description,
    });

    final response = await dio.post("Announcement/CreateAnnouncement", data: postData);
    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
    return false;
  }

  @override
  Future<AnnouncementTypeModel?> getAnnouncementTypes() async {
    try {
      final response = await dio.get('AnnouncementType/GetAnnouncementType');
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return AnnouncementTypeModel.fromJson(jsonBody);
        }
      }
    } on DioException catch (error) {
      if (kDebugMode) {
        print("Dio Announcements error: $error");
      }
    }
    return null;
  }

  @override
  Future<bool> deleteAnnouncement(String guid) async {
    var data = json.encode({"guid": guid});
    var response = await dio.delete('Announcement', data: data);
    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> editAnnouncement(
      String guid, String title, String description, int announcementTypeId, int schoolId) async {
    var data = json.encode({
      "guid": guid,
      "announcementTypeId": announcementTypeId,
      "schoolId": schoolId,
      "title": title,
      "description": description,
    });
    var response = await dio.put('Announcement/UpdateAnnouncement', data: data);
    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
    return false;
  }
}

final announcementServiceProvider = Provider<AnnouncementService>((ref) {
  final dio = ref.read(dioProvider);

  return AnnouncementService(dio);
});
