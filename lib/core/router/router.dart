
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class HYRouter {
  static final String initialRoute = HYMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HYMainScreen.routeName: (ctx) => HYMainScreen(),
    HYMealScreen.routeName: (ctx) => HYMealScreen(),
    DYDetailScreen.routeName: (ctx) => DYDetailScreen(),
    HYFilterScreen.routeName: (ctx) => HYFilterScreen(),
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == HYFilterScreen.routeName) {
      return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (ctx) {
            return HYFilterScreen();
          });
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
