import 'dart:ffi';

import 'package:favorcate/ui/pages/base/base_less_widget.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYHomeDrawer extends BaseLessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: [
            buildHeaderView(context),
            buildListTile(context, Icon(Icons.restaurant), "进餐", () {
              Navigator.of(context).pop();
            }),
            buildListTile(context, Icon(Icons.settings), "过滤", () {
              Navigator.of(context).pushNamed(HYFilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 120.px,
        color: Colors.orange,
        alignment: Alignment(0, 0.5),
        margin: EdgeInsets.only(bottom: 20.px),
        child: Text('开始动手',
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(fontWeight: FontWeight.bold)));
  }

  Widget buildListTile(
      BuildContext context, Widget imgIcon, String title, Function Handler) {
    return ListTile(
      leading: imgIcon,
      title: Text(title, style: Theme.of(context).textTheme.headline2),
      onTap: Handler,
    );
  }
}
