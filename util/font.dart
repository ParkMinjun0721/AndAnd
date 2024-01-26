import 'package:flutter/material.dart';

TextStyle title1({bool responsible = false, Color? color}) {
  return TextStyle(
    fontSize: responsible ? 18 : 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    color: color,
  );
}