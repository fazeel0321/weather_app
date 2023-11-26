import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'constants.dart';

class CustomTextWidget extends StatelessWidget {
  var text;
  var color;
  var fontSize;
  var fontfamily;
  var fontWeight;

  CustomTextWidget(
      {required this.text,
      this.color = MyColors.black,
      this.fontSize = 16.0,
      this.fontfamily,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontfamily),
    );
  }
}

class CustomContainerWidget extends StatelessWidget {
  var child;
  var color;
  var bcolor;
  var circular;
  var bwidth;
  var width;
  var height;
  // var networkImage;

  CustomContainerWidget(
      {required this.child,
      this.color = Colors.white,
      this.width = 100.0,
      this.height = 100.0,
      this.bcolor,
      this.bwidth = 1.0,
      // this.networkImage,
      this.circular});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: child,
      decoration: BoxDecoration(
          border: Border.all(width: bwidth, color: bcolor),
          color: color,
          // image: DecorationImage(image: networkImage),
          borderRadius: BorderRadius.circular(circular)),
    );
  }
}

class CustomIcon extends StatelessWidget {
  var icon;
  var color;
  var Size;
  CustomIcon({required this.icon, this.color, this.Size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: Size,
    );
  }
}

class CustomTextField extends StatelessWidget {
  var htext;
  var bcircular;
  var picon;
  var bcolor;
  var ltext;
  CustomTextField(
      {this.bcircular, this.bcolor, this.htext, this.picon, this.ltext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: htext,
          labelText: ltext,
          prefixIcon: picon,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: bcolor),
              borderRadius: BorderRadius.circular(bcircular))),
    );
  }
}

class CustomImageContainer extends StatelessWidget {
  var imageUrl;
  var width;
  var fit;
  var child;
  var height;
  CustomImageContainer({
    required this.imageUrl,
    this.width = 100.0,
    this.height = 100.0,
    this.child,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: child,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: fit),
      ),
    );
  }
}

class ImageTextContainer extends StatelessWidget {
  var imageurl;
  var hieght;
  var width;
  var text;
  var tcolor;
  ImageTextContainer(
      {this.hieght = 200,
      this.width,
      this.imageurl,
      this.text,
      this.tcolor = MyColors.white});

  @override
  Widget build(BuildContext context) {
    return CustomImageContainer(
      imageUrl: imageurl,
      height: hieght,
      width: width,
      fit: BoxFit.cover,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(),
            CustomTextWidget(
              text: text,
              fontfamily: 'Bold',
              fontSize: 30,
              color: tcolor,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSnackBar extends SnackBar {
  final String message;
  final Color backgroundColor;
  final Duration duration;

  CustomSnackBar({
    required this.message,
    this.backgroundColor = Colors.blue,
    this.duration = const Duration(seconds: 3),
  }) : super(
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: backgroundColor,
          duration: duration,
        );
}
