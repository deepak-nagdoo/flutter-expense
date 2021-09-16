import 'package:flutter/material.dart';

class NiyoAppBar {
  static AppBar? appBar;

  static bar(BuildContext context, List<Widget> actions) {
    appBar = AppBar(
      title: Text(
        'Test Sample App',
        style: Theme.of(context).appBarTheme.textTheme!.headline1,
      ),
      actions: actions,
    );
    return appBar;
  }
}
