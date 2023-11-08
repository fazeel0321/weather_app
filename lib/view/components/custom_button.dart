import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/constants.dart';
import '../../utils/custom_widget.dart';

class CustomButton extends StatelessWidget {
  var text;
  var padh;
  var padv;
  var hieght;
  var bcolor;
  var tcolor;
  var fontsize;
  var color;
  var width;
  CustomButton(
      {required this.text,
      this.padh = 10.0,
      this.padv = 20.0,
      this.color = MyColors.red,
      this.bcolor = MyColors.red,
      this.fontsize,
      this.tcolor = MyColors.white,
      this.hieght = 40.0,
      this.width = 70.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padh, vertical: padv),
      child: CustomContainerWidget(
        child: Center(
          child: CustomTextWidget(
            text: text,
            fontSize: fontsize,
            color: tcolor,
          ),
        ),
        height: hieght,
        width: width,
        circular: 30.0,
        color: color,
        bcolor: bcolor,
      ),
    );
  }
}

class TextSizeButton extends StatelessWidget {
  var text;

  TextSizeButton({this.text});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
      child: Center(child: CustomTextWidget(text: text)),
      circular: 10.0,
      color: MyColors.white,
      bcolor: MyColors.black,
      height: 40.0,
      width: 100.0,
    );
  }
}
