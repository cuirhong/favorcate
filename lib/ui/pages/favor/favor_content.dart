import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/base/base_less_widget.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HYFavorContent extends BaseLessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HYFavorViewModel>(builder: (ctx, favorVM, child) {
      if (favorVM.originMeals.length == 0){
        return Center(
          child: Text('未收藏美食',style: TextStyle(fontSize: 21.px,color: Theme.of(context).primaryColor)),
        );
      }
      return ListView.builder(
          itemCount: favorVM.originMeals.length,
          itemBuilder: (itemCtx, index) {
            return HYMealItem(favorVM.originMeals[index]);
          });
    });
  }
}
