import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool byuser;
  final Brightness theme;

  MessageWidget({this.message, this.byuser, this.theme});

  EdgeInsets _getPadding() {
    return byuser
        ? EdgeInsets.fromLTRB(80, 10, 10, 10)
        : EdgeInsets.fromLTRB(10, 10, 80, 10);
  }

  Color _getBackground() {
    if (theme == Brightness.dark) {
      return byuser
          ? Color.fromARGB(255, 130, 168, 231)
          : Color.fromARGB(255, 60, 64, 67);
    } else {
      return byuser
          ? Color.fromARGB(255, 210, 227, 252)
          : Color.fromARGB(255, 241, 243, 244);
    }
  }

  Color _getColor() {
    if (theme == Brightness.dark) {
      return byuser
          ? Color.fromARGB(255, 32, 33, 36)
          : Color.fromARGB(255, 255, 255, 255);
    } else {
      return byuser
          ? Color.fromARGB(255, 23, 78, 166)
          : Color.fromARGB(255, 32, 33, 36);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _getPadding(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _getBackground(),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
            padding: EdgeInsets.all(13),
            child: Text(
              message,
              style: TextStyle(fontSize: 15, color: _getColor()),
            )),
      ),
    );
  }
}
