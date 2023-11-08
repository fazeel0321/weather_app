import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/constants.dart';
import '../../utils/custom_widget.dart';

class MyRow extends StatelessWidget {
  var text;
  var text1;
  var icon;
  var icon1;
  var icon2;

  MyRow({this.icon, this.icon1, this.icon2, this.text, this.text1});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
        height: 30.0,
        width: MediaQuery.of(context).size.width,
        circular: 0.0,
        color: Color.fromARGB(255, 247, 250, 252),
        bcolor: Color.fromARGB(255, 230, 246, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  CustomTextWidget(text: text),
                ],
              ),
              Row(
                children: [
                  Icon(icon1),
                  CustomTextWidget(text: text1),
                ],
              ),
              Icon(icon2)
            ],
          ),
        ));
  }
}

class BrandRow extends StatelessWidget {
  var text;
  var color;
  var Ccolor;
  var bcolor;

  BrandRow(
      {this.Ccolor = MyColors.white,
      this.text,
      this.color = MyColors.black,
      this.bcolor = MyColors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: [
          CustomTextWidget(
            text: text,
            color: color,
          ),
          Spacer(),
          CustomContainerWidget(
            child: Center(
                child: Icon(
              Icons.done,
              size: 12.0,
              color: MyColors.white,
            )),
            color: Ccolor,
            bcolor: bcolor,
            circular: 5.0,
            height: 20.0,
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
