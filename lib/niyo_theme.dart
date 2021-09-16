import 'package:flutter/material.dart';
import 'package:flutter_sample_app/niyo_app_bar.dart';

class NiyoTheme {
  static main(BuildContext context) {
    return ThemeData.light().textTheme.copyWith(
        headline1: TextStyle(
          fontFamily: 'LexendDeca',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ));
  }

  static appBar() {
    return AppBarTheme(
      textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(
              fontFamily: 'Galano',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
    );
  }

  static singleUnit(BuildContext ctx) {
    return MediaQuery.of(ctx).size.width / 360;
  }

  static dynamicWidth(BuildContext ctx, width) {
    return singleUnit(ctx) * width;
  }

  static dynamicHeight(BuildContext ctx, height) {
    return MediaQuery.of(ctx).size.height - dynamicWidth(ctx, height);
  }

  static abstractDeviceHeight(BuildContext ctx, height) {
    return dynamicHeight(ctx, height) -
        NiyoAppBar.appBar!.preferredSize.height -
        MediaQuery.of(ctx).padding.top;
  }
}
