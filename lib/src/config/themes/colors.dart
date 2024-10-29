import 'package:flutter/material.dart';

const primaryColor = Color(0xFF48BD1F);

const black = Colors.black;
const white = Colors.white;

final black25 = Colors.black.withOpacity(.25);

final black60 = Colors.black.withOpacity(.60);

const gradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  stops: [0.38, 1.0],
  colors: [
    Color(0xFFC5FBB3),
    Color(0x00C5FBB3),
  ],
);
