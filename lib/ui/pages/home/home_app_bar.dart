import 'package:favorcate/ui/pages/base/base_less_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYHomeAppBar extends AppBar {
  HYHomeAppBar(BuildContext context)
      : super(
          title: Text('美食广场'),
          // builder是延迟的效果，重点知识点
          leading: Builder(
            builder: (ctx) {
              return IconButton(
                icon: Icon(Icons.build),
                onPressed: () {
                  //本来之前使用ctx，但是为了drawer可以覆盖tabbar，直接使用context就好了
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        );
}
