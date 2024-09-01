import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
        baseUrl: 'https://www.kidsconnect.com.tr/api/', // Buraya kendi base URL'inizi koyun
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 3000),
        headers: {
          'CONTENT_TYPE': 'APPLICATION_JSON',
          'ACCEPT': 'APPLICATION_JSON',
        }),
  );
});
