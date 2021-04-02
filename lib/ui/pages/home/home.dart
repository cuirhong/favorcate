import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/services/json_parse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class HYHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食广场'),
      ),
      body: HYHomeContent(),
    );
  }
}

class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  List<HYCategoryModel> _categoryModels = [];

  @override
  void initState() {
    super.initState();
    JsonParse.getCategoriesData().then((value) {
      setState(() {
        _categoryModels = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(20.px),
        itemCount: _categoryModels.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.px,
            mainAxisSpacing: 20.px,
            childAspectRatio: 1.5),
        itemBuilder: (ctx, index) {
          final bgColor = _categoryModels[index].cColor;
          return Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [bgColor.withOpacity(.5),bgColor]
                )
              ),
              alignment: Alignment.center,
              child: Text(_categoryModels[index].title,
                  style: Theme.of(context).textTheme.headline2.copyWith(
                    fontWeight: FontWeight.bold
                  )));
        });
  }
}
