import 'package:favorcate/ui/pages/main/initialize_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYMainScreen extends StatefulWidget {
  static const String routeName = '/';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<HYMainScreen> {
  int _screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _screenIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: items,
        onTap: (index){
          setState(() {
            _screenIndex = index;
          });
        },
      ),
    );
  }
}
