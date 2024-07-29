import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../product/services/project_service.dart';
import '../model/schools_model.dart';
import '../service/home_service.dart';

class HomeViewModel with ChangeNotifier, ProjectService {
  final IHomeService homeService;
  List<Payload> schools = [];

  HomeViewModel(ref, this.homeService) {
    initDio(ref);
    //fetchSchool();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchSchool() async {
    _setLoading(true);
    SchoolsModel? response = await homeService.getSchools();
    if (response != null) {
      schools = response.payload;
      _setLoading(false);
    } else {
      showToastMessage("Beklenmedik bir hata oluştu", Colors.red);
    }
    _setLoading(false);
  }

  Future<void> showToastMessage(String toastMessage, Color statusColor) {
    return Fluttertoast.showToast(
        msg: toastMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: statusColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

final homeViewModelProvider = ChangeNotifierProvider((ref) {
  final homeService = ref.read(homeServiceProvider);
  return HomeViewModel(ref, homeService);
});
