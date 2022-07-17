import 'dart:ffi';

import 'package:finalexam/app/route.locator.dart';
import 'package:finalexam/home_screen.dart';
import 'package:finalexam/services/authService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _auth = locator<AuthService>();
  final _navigate = locator<NavigationService>();

  Future<void> login(String email, String pass) async {
    var check = await _auth.signIn(email, pass);
    print(check);
    if (check != null) {
      _navigate.navigateToView(HomeScreen());
    }
  }
}
