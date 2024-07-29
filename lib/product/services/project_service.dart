import 'package:dio/dio.dart';

import 'dio_provider.dart';

mixin ProjectService {
  late Dio dio;

  void initDio(ref) {
    dio = ref.read(dioProvider);
  }
}
