import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'filter_content.dart';

class HYFilterScreen extends StatelessWidget {
  static final String routeName = "/filter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        leading: Icon(Icons.close),
        title: Text('过滤'),
      ),
      body: HYFilterContent(),
    );
  }
}
