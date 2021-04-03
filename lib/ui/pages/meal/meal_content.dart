import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class HYMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取参数
    final category =
        ModalRoute.of(context).settings.arguments as HYCategoryModel;
    return Selector<HYMealViewModel, List<HYMealModel>>(
      builder: (ctx, meals, child) {
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return HYMealItem(meals[index]);
            });
      },
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      selector: (ctx, mealVM) => mealVM.meals
          .where((element) => element.categories.contains(category.id))
          .toList(),
//      child: ,
    );
  }
}

//Consumer<HYMealViewModel>(builder: (ctx, mealVM, child) {
//print(mealVM.meals);
//final meals = mealVM.meals.where((element) => element.categories.contains(category.id)).toList();
//return ListView.builder(itemBuilder: (ctx,index){
//return ListTile(title: Text(meals[index].title));
//});
//});
