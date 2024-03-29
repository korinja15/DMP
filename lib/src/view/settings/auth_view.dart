import 'package:Talkvee/src/view/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  void _checkPin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    String realPin = prefs.getString("PIN");
    if (realPin == pin) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SettingsMenu()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Builder(
          builder: (context) => Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: PinPut(
                    autoFocus: true,
                    fieldsCount: 4,
                    onSubmit: (String x) => _checkPin(x),
                    isTextObscure: true,
                    actionButtonsEnabled: true,
                    clearButtonIcon: Icon(
                      Icons.close,
                      size: 35,
                    ),
                  ),
                ),
              ),
        ));
  }
}
