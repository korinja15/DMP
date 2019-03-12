import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupAuth extends StatefulWidget {
  @override
  _SetupAuthState createState() => _SetupAuthState();
}

class _SetupAuthState extends State<SetupAuth> {
  void _setPin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("PIN", pin);
    Navigator.pop(context);
    Navigator.pop(context);
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
                    onSubmit: (String x) => _setPin(x),
                    isTextObscure: false,
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
