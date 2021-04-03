import 'package:favorcate/ui/pages/base/base_less_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYOperationItem extends BaseLessWidget {
  final Widget _icon;
  final String _title;
  HYOperationItem(this._icon,this._title);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        SizedBox(width: 3.px),
        Text(_title)
      ],
    );
  }
}
