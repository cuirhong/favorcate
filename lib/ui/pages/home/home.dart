import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/services/json_parse.dart';
import 'package:favorcate/ui/pages/base/base_ful_widget.dart';
import 'package:favorcate/ui/pages/home/home_app_bar.dart';
import 'package:favorcate/ui/pages/home/home_category_item.dart';
import 'package:favorcate/ui/pages/home/home_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYHomeAppBar(context),
      body: HYHomeContent(),
      drawer: HYHomeDrawer(),
    );
  }
}

class HYHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: JsonParse.getCategoriesData(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Center(child: Text("请求出错"));
          }
          final categoryModels = snapshot.data;
          return GridView.builder(
              padding: EdgeInsets.all(20.px),
              itemCount: categoryModels.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.px,
                  mainAxisSpacing: 20.px,
                  childAspectRatio: 1.5),
              itemBuilder: (ctx, index) {
                final bgColor = categoryModels[index].cColor;
                return HYHomeCategoryItem(categoryModels[index]);
              });
        });
  }
}
