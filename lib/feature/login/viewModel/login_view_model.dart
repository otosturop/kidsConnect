import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bottom_navigation/view/bottom_navigation_view.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLogin = false;
  bool _isLoading = false;
  bool textPasswordType = true;
  String? _email;
  String? _password;

  set setEmail(value) {
    _email = value;
  }

  set setPassword(value) {
    _password = value;
  }

  void changeTypePassword() {
    textPasswordType = !textPasswordType;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    debugPrint("e posta: $_email password: $_password");
    if (_email == 'admin' && _password == '235711') {
      Navigator.pushNamedAndRemoveUntil(context, BottomNavigationView.routeName, (route) => false);
    } else {
      showToastMessage("Hatalı giriş bilgileri", Colors.red);
    }
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

  setLoader() {
    _isLoading = !_isLoading;
  }
}

final loginProvider = ChangeNotifierProvider((ref) => LoginViewModel());
