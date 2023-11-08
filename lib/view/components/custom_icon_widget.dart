import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/constants.dart';
import '../../utils/custom_widget.dart';

class CustomIconButton extends StatelessWidget {
  var icon;
  var color;
  var icolor;
  CustomIconButton(
      {this.color = MyColors.red,
      this.icolor = MyColors.white,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: CustomIcon(
        icon: icon,
        color: icolor,
      ),
      backgroundColor: color,
    );
  }
}
