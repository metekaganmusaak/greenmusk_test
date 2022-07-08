import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greenmusk_test/app.dart';
import 'package:greenmusk_test/core/constants/app_colors.dart';

void main() {
  /// Status bar's color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const App());
}
