class AnnouncementTypeModel {
  bool? success;
  int? statusCode;
  String? message;
  List<Payload>? payload;

  AnnouncementTypeModel({this.success, this.statusCode, this.message, this.payload});

  AnnouncementTypeModel.fromJson(Map<String, dynamic> json) {
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
  int? announcementTypeId;
  String? name;

  Payload({this.announcementTypeId, this.name});

  Payload.fromJson(Map<String, dynamic> json) {
    announcementTypeId = json['announcementTypeId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['announcementTypeId'] = announcementTypeId;
    data['name'] = name;
    return data;
  }
}
