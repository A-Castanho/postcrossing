import 'package:flutter/material.dart';

class MainViewData {
  Widget view;
  PreferredSizeWidget? appbar;
  String title;
  Icon icon;

  MainViewData({
    required this.view,
    this.appbar,
    this.title = '',
    required this.icon,
  });
}
