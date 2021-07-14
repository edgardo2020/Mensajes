import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String texto;
  final double sizeFont;
  final FontWeight fontWeigt;
  final Color colorFont;
  final bool click;
  final String route;
  const CustomText(
      {Key key,
      @required this.texto,
      this.colorFont = Colors.black,
      this.sizeFont = 12,
      this.fontWeigt = FontWeight.normal,
      this.click = false,
      this.route})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: click
          ? GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, this.route);
              },
              child: Text(
                this.texto,
                style: TextStyle(
                    color: this.colorFont,
                    fontSize: this.sizeFont,
                    fontWeight: this.fontWeigt),
              ),
            )
          : Text(
              this.texto,
              style: TextStyle(
                  color: this.colorFont,
                  fontSize: this.sizeFont,
                  fontWeight: this.fontWeigt),
            ),
    );
  }
}
