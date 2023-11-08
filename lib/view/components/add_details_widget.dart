import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/constants.dart';
import '../../utils/custom_widget.dart';

class AddDetails extends StatelessWidget {
  var text;
  var text2;
  var icon;
  var hieght;
  var padh;
  var size;
  AddDetails(
      {this.text,
      this.text2,
      this.icon,
      this.hieght = 60.0,
      this.padh = 15.0,
      this.size = 12.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padh, vertical: 10.0),
      child: CustomContainerWidget(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: text,
                color: MyColors.grey,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  CustomTextWidget(
                    text: text2,
                    color: MyColors.black,
                  ),
                  Spacer(),
                  CustomIcon(
                    icon: icon,
                    Size: size,
                  )
                ],
              ),
            ],
          ),
        ),
        height: hieght,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        bcolor: MyColors.white,
        circular: 10.0,
      ),
    );
  }
}

class AddDetail2 extends StatelessWidget {
  var text;

  var icon;
  var hieght;
  var padh;
  AddDetail2({this.text, this.icon, this.hieght = 60.0, this.padh = 15.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padh, vertical: 10.0),
      child: CustomContainerWidget(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: text,
                color: MyColors.grey,
              ),
            ],
          ),
        ),
        height: hieght,
        width: MediaQuery.of(context).size.width,
        color: MyColors.white,
        bcolor: MyColors.white,
        circular: 10.0,
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  var text1;
  var text2;
  var text3;
  var hieght;
  var icolor;
  var text4;
  DetailCard(
      {this.text1,
      this.text2,
      this.text3,
      this.hieght = 110.0,
      this.icolor = MyColors.black,
      this.text4});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: CustomContainerWidget(
          height: hieght,
          width: MediaQuery.of(context).size.width,
          color: MyColors.white,
          bcolor: MyColors.white,
          circular: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomTextWidget(text: text1),
                    Spacer(),
                    CustomTextWidget(
                      text: 'Change',
                      color: MyColors.red,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                CustomTextWidget(text: text2),
                SizedBox(
                  height: 5,
                ),
                CustomTextWidget(text: text3),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CustomContainerWidget(
                      bcolor: MyColors.black,
                      height: 20.0,
                      width: 20.0,
                      color: MyColors.black,
                      circular: 5.0,
                      child: Center(
                        child: CustomIcon(
                          icon: Icons.done,
                          Size: 12.0,
                          color: MyColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    CustomTextWidget(text: text4),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class DetailCard2 extends StatelessWidget {
  var text1;
  var text2;
  var text3;
  var hieght;
  var icolor;

  DetailCard2({
    this.text1,
    this.text2,
    this.text3,
    this.hieght = 110.0,
    this.icolor = MyColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: CustomContainerWidget(
          height: hieght,
          width: MediaQuery.of(context).size.width,
          color: MyColors.white,
          bcolor: MyColors.white,
          circular: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomTextWidget(text: text1),
                    Spacer(),
                    CustomTextWidget(
                      text: 'Change',
                      color: MyColors.red,
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomTextWidget(text: text2),
                SizedBox(
                  height: 5.0,
                ),
                CustomTextWidget(text: text3),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          )),
    );
    ;
  }
}
