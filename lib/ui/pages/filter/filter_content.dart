import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:favorcate/ui/pages/base/base_less_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HYFilterContent extends BaseLessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildYourChoice(context),
        buildChoiceSelect()
      ],
    );
  }

  Widget buildYourChoice(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text('展示你的选择',
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
      child: Consumer<HYFilterViewModel>(
        builder: (ctx,filterVM,child){
          return ListView(
            shrinkWrap: true,
            children: [
              buildListTitle('无谷蛋白', '展示无谷蛋白食物',filterVM.isGlutenFree, (value){
                filterVM.isGlutenFree = value;
              }),
              buildListTitle('不含乳糖', '展示不含乳糖食物',filterVM.isLactoseFree, (value){
                filterVM.isLactoseFree = value;
              }),
              buildListTitle('普通素食主义', '展示普通素食主义食物', filterVM.isVegetarian,(value){
                filterVM.isVegetarian = value;
              }),
              buildListTitle('严格素食者', '展示严格素食者食物',filterVM.isVegan, (value){
                filterVM.isVegan = value;
              }),
            ],
          );
        }
      ),
    );
  }

  Widget buildListTitle(String title,String subTitle,bool value,Function onChange){
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(value: value,onChanged: onChange),
    );
  }
}
