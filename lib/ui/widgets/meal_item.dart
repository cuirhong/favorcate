import 'package:favorcate/core/model/detail_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/ui/pages/base/base_less_widget.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/widgets/operation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYMealItem extends BaseLessWidget {
  final cardRadius = 12.px;
  final HYMealModel _mealModel;

  HYMealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5.px,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: [buildBasicInfo(context), buildOperationInfo()],
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(DYDetailScreen.routeName,arguments: _mealModel);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cardRadius),
              topRight: Radius.circular(cardRadius)),
          child: Image.network(_mealModel.imageUrl,
              width: double.infinity, height: 250.px, fit: BoxFit.cover),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.px),
            ),
            child: Text(_mealModel.title,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.white)),
          ),
        )
      ],
    );
  }

  ///
  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HYOperationItem(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
          HYOperationItem(Icon(Icons.restaurant), "${_mealModel.complexStr}"),
          HYOperationItem(Icon(Icons.favorite), "未收藏"),
        ],
      ),
    );
  }
}
