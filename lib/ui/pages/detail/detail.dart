import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DYDetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final mealModel = ModalRoute.of(context).settings.arguments as HYMealModel;
    return Scaffold(
      appBar: AppBar(title: Text(mealModel.title)),
      body: Center(child: Text(mealModel.title),),
    );
  }
}
