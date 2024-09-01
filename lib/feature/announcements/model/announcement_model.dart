class AnnouncementModel {
  bool? success;
  int? statusCode;
  String? message;
  List<Payload>? payload;

  AnnouncementModel({this.success, this.statusCode, this.message, this.payload});

  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(Payload.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (payload != null) {
      data['payload'] = payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payload {
  String? guid;
  String? title;
  String? description;
  int? schoolId;
  int? announcementTypeId;

  Payload({this.guid, this.title, this.description, this.schoolId, this.announcementTypeId});

  Payload.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    title = json['title'];
    description = json['description'];
    schoolId = json['schoolId'];
    announcementTypeId = json['announcementTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guid'] = guid;
    data['title'] = title;
    data['description'] = description;
    data['schoolId'] = schoolId;
    data['announcementTypeId'] = announcementTypeId;
    return data;
  }
}
