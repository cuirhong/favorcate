import 'package:favorcate/core/router/router.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/shared/app_theme.dart';
import 'package:favorcate/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider(create: (ctx) => HYFilterViewModel()),
      ChangeNotifierProxyProvider<HYFilterViewModel, HYMealViewModel>(
          create: (ctx) => HYMealViewModel(),
          update: (ctx, filterVM, mealVM) {
            mealVM.updateFilters(filterVM);
            return mealVM;
          }),

      ChangeNotifierProxyProvider<HYFilterViewModel, HYFavorViewModel>(
          create: (ctx) => HYFavorViewModel(),
          update: (ctx, filterVM, favorVM) {
            favorVM.updateFilters(filterVM);
            return favorVM;
          }),
    ],
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    return MaterialApp(
      title: '美食广场',
      theme: HYAppTheme.norTheme,

      //路由
      initialRoute: HYRouter.initialRoute,
      routes: HYRouter.routes,
      onGenerateRoute: HYRouter.generateRoute,
      onUnknownRoute: HYRouter.unknownRoute,
    );
  }
}
