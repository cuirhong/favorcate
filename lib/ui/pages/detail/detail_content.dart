import 'package:favorcate/core/model/detail_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/ui/pages/base/base_less_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYDetailContent extends BaseLessWidget {
  final HYMealModel _mealModel;

  HYDetailContent(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context, "制作步骤"),
          buildStep(context),
          SizedBox(height: 34.px,)
        ],
      ),
    );
  }

  /// 1.横幅的图片
  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(_mealModel.imageUrl),
    );
  }

  /// 2.制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _mealModel.ingredients.length,
            itemBuilder: (ctx, index) {
              return Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(_mealModel.ingredients[index])),
              );
            }));
  }

  /// 3.制作步骤
  Widget buildStep(BuildContext context) {
    return buildMakeContent(
        context: context,
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
//                  backgroundColor: Colors.orange,
                  child: Text("#${index + 1}"),
                ),
                title: Text(_mealModel.steps[index]),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: _mealModel.steps.length));
  }

  /// 公共方法
  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.all(10.px),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }

  ///
  Widget buildMakeContent({BuildContext context, Widget child}) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.px)),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }
}
