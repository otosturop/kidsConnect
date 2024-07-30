import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../product/services/dio_provider.dart';

abstract class IAnnouncementService {
  final Dio dio;

  IAnnouncementService(this.dio);
}

class AnnouncementService extends IAnnouncementService {
  AnnouncementService(super.dio);
}

final announcementServiceProvider = Provider<AnnouncementService>((ref) {
  final dio = ref.read(dioProvider);

  return AnnouncementService(dio);
});
