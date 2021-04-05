import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail_content.dart';
import 'package:favorcate/ui/pages/detail/detail_floating_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DYDetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final mealModel = ModalRoute.of(context).settings.arguments as HYMealModel;
    return Scaffold(
      appBar: AppBar(title: Text(mealModel.title)),
      body: HYDetailContent(mealModel),
      floatingActionButton: HYDetailFloatingButton(mealModel),
    );
  }
}
