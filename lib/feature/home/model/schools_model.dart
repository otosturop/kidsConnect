import 'dart:convert';

SchoolsModel schoolsModelFromJson(String str) => SchoolsModel.fromJson(json.decode(str));

String schoolsModelToJson(SchoolsModel data) => json.encode(data.toJson());

class SchoolsModel {
  bool success;
  int statusCode;
  String message;
  List<Payload> payload;

  SchoolsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.payload,
  });

  factory SchoolsModel.fromJson(Map<String, dynamic> json) => SchoolsModel(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
      };
}

class Payload {
  int schoolId;
  int userTypeId;
  String name;
  String code;
  String address;
  String phoneNumber;
  dynamic userType;
  List<dynamic> attendances;
  List<dynamic> employees;

  Payload({
    required this.schoolId,
    required this.userTypeId,
    required this.name,
    required this.code,
    required this.address,
    required this.phoneNumber,
    required this.userType,
    required this.attendances,
    required this.employees,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        schoolId: json["schoolId"],
        userTypeId: json["userTypeId"],
        name: json["name"],
        code: json["code"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        userType: json["userType"],
        attendances: List<dynamic>.from(json["attendances"].map((x) => x)),
        employees: List<dynamic>.from(json["employees"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "schoolId": schoolId,
        "userTypeId": userTypeId,
        "name": name,
        "code": code,
        "address": address,
        "phoneNumber": phoneNumber,
        "userType": userType,
        "attendances": List<dynamic>.from(attendances.map((x) => x)),
        "employees": List<dynamic>.from(employees.map((x) => x)),
      };
}
