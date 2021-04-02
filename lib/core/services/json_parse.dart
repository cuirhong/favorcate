import 'dart:convert';

import 'package:favorcate/core/model/category_model.dart';
import 'package:flutter/services.dart';

class JsonParse{
  static Future<List<HYCategoryModel>> getCategoriesData() async{
    // 1. 加载json文件
    final jsonString = await rootBundle.loadString('assets/json/category.json');
    // 2.将json字符串转Map/List
    final result = json.decode(jsonString);
    // 3.将Map中的内容转成一个个对象
    final resultList = result["category"];
    List<HYCategoryModel> categoryModels = [];
    for (var json in resultList){
      categoryModels.add(HYCategoryModel.fromJson(json));
    }
    return categoryModels;
  }
}