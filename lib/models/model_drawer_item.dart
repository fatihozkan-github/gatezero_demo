import 'package:flutter/material.dart';

class DrawerItemModel {
  Key key;
  String title;
  String screen;
  IconData icon;

  DrawerItemModel({this.title, this.icon, this.key, this.screen});
}
