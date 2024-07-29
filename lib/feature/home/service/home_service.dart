import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../product/services/dio_provider.dart';
import '../model/schools_model.dart';

abstract class IHomeService {
  final Dio dio;

  IHomeService(this.dio);

  Future<SchoolsModel?> getSchools();
}

class HomeService extends IHomeService {
  HomeService(super.dio);

  @override
  Future<SchoolsModel?> getSchools() async {
    try {
      final response = await dio.get('GetSchools');
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return SchoolsModel.fromJson(jsonBody);
        }
      }
    } on DioException catch (error) {
      print("Dio Schools error: $error");
    }
    return null;
  }
}

final homeServiceProvider = Provider<HomeService>((ref) {
  final dio = ref.read(dioProvider);
  return HomeService(dio);
});
