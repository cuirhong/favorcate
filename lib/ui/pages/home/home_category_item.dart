import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYHomeCategoryItem extends StatelessWidget {
  final HYCategoryModel _categoryModel;

  HYHomeCategoryItem(this._categoryModel);

  @override
  Widget build(BuildContext context) {
    final bgColor = _categoryModel.cColor;
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              gradient:
                  LinearGradient(colors: [bgColor.withOpacity(.5), bgColor])),
          alignment: Alignment.center,
          child: Text(_categoryModel.title,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(fontWeight: FontWeight.bold))),
      onTap: (){
        Navigator.of(context).pushNamed(HYMealScreen.routeName,arguments: _categoryModel);
      },
    );
  }
}
