import 'package:Talkvee/src/view/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthView {
  Future<bool> auth() async {
    var localAuth = LocalAuthentication();
    bool check = await localAuth.canCheckBiometrics;
    if (check) {
      return await localAuth.authenticateWithBiometrics(
        localizedReason: "Authenticate to continue",
      );
    } else {
      return false;
    }
  }
}
