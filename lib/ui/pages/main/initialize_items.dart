import 'package:favorcate/ui/pages/favor/favor.dart';
import 'package:favorcate/ui/pages/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> pages = [
  HYHomeScreen(),
  HYFavorScreen()
];

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    label: "首页",
    icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    label: "收藏",
    icon: Icon(Icons.star),
  )
];