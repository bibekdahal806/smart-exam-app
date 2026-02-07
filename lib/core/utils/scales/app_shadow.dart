import 'package:flutter/material.dart';

class AppShadow {
  static const shadow01 = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 1,
      color: Color.fromRGBO(0, 0, 0, 0.11),
    ),
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 1,
      color: Color.fromRGBO(0, 0, 0, 0.09),
    ),
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 3,
      color: Color.fromRGBO(0, 0, 0, 0.16),
    ),
  ];

  static const shadow02 = [
    BoxShadow(
      offset: Offset(0, 6),
      blurRadius: 10,
      color: Color.fromRGBO(0, 0, 0, 0.11),
    ),
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 18,
      color: Color.fromRGBO(0, 0, 0, 0.09),
    ),
    BoxShadow(
      offset: Offset(0, 3),
      blurRadius: 5,
      color: Color.fromRGBO(0, 0, 0, 0.16),
    ),
  ];

  static const shadow03 = [
    BoxShadow(
      offset: Offset(0, 12),
      blurRadius: 17,
      color: Color.fromRGBO(0, 0, 0, 0.11),
    ),
    BoxShadow(
      offset: Offset(0, 5),
      blurRadius: 22,
      color: Color.fromRGBO(0, 0, 0, 0.09),
    ),
    BoxShadow(
      offset: Offset(0, 7),
      blurRadius: 8,
      color: Color.fromRGBO(0, 0, 0, 0.16),
    ),
  ];
  static const shadowX0Y5B10SR0 = BoxShadow(
    color: Color(0x1A000000), // #0000001A
    offset: Offset(0, 5), // x=0, y=5
    blurRadius: 10, // blur = 10
    spreadRadius: 0, // spread = 0
  );
}
