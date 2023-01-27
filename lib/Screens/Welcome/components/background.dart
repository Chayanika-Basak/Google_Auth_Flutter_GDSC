import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key, 
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: Colors.white,
        height: size.height,
        width: double.infinity,
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/topLeft2.png')),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/images/bottomRight.png')),
          child,
        ]));
  }
}
