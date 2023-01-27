import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text, fontFamily;
  final void Function() press;
  final Color color, textColor;
  final Widget? icon;
  final double? fontSize;
  const RoundButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.fontFamily,
    this.icon, 
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        heroTag: null,
        onPressed: press,
        backgroundColor: color,
        icon: icon,
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(text,
              style: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              )),
        ));
  }
}
