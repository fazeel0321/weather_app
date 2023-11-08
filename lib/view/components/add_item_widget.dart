import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/custom_widget.dart';

class BagAddItem extends StatelessWidget {
  var image;
  var chieght;
  var ehieght;
  var ftext;
  var ctext;
  var colortext;
  var stext;
  var sizetext;
  var price;
  BagAddItem(
      {this.chieght = 120.0,
      this.colortext,
      this.ctext,
      this.ehieght = 120.0,
      this.ftext,
      this.image,
      this.sizetext,
      this.price,
      this.stext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          CustomImageContainer(
            imageUrl: image,
            fit: BoxFit.cover,
            height: chieght,
            width: MediaQuery.of(context).size.width / 3.0,
          ),
          Expanded(
            child: CustomContainerWidget(
                height: ehieght,
                color: MyColors.white,
                bcolor: MyColors.white,
                circular: 10.0,
                // width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            text: ftext,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            fontfamily: 'Medium',
                          ),
                          Spacer(),
                          CustomIcon(
                            icon: Icons.menu,
                            color: MyColors.grey,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            text: ctext,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: MyColors.grey,
                            fontfamily: 'Medium',
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          CustomTextWidget(
                            text: colortext,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            fontfamily: 'Medium',
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          CustomTextWidget(
                            text: stext,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: MyColors.grey,
                            fontfamily: 'Medium',
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          CustomTextWidget(
                            text: sizetext,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            fontfamily: 'Medium',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 255, 249, 234),
                            child: CustomIcon(
                              icon: Icons.add,
                              color: MyColors.black,
                              Size: 15.0,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          CustomTextWidget(text: '1'),
                          SizedBox(
                            width: 10.0,
                          ),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 219, 215, 203),
                            child: Center(
                              child: CustomIcon(
                                icon: Icons.minimize,
                                color: MyColors.black,
                                Size: 18.0,
                              ),
                            ),
                          ),
                          Spacer(),
                          CustomTextWidget(
                            text: price,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class ItemSeasonCard extends StatelessWidget {
  var image;
  var chieght;
  var ehieght;
  var utext;
  var ltext;
  var timetext;
  ItemSeasonCard(
      {this.chieght = 80.0,
      this.ehieght = 80.0,
      this.image,
      this.utext,
      this.ltext,
      this.timetext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Row(
        children: [
          CustomImageContainer(
            imageUrl: image,
            fit: BoxFit.cover,
            height: chieght,
            width: MediaQuery.of(context).size.width / 3.0,
          ),
          Expanded(
            child: CustomContainerWidget(
                height: ehieght,
                color: MyColors.white,
                bcolor: MyColors.white,
                circular: 10.0,
                // width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  text: utext,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                CustomTextWidget(
                                  text: ltext,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: Column(
                              children: [
                                CustomTextWidget(
                                  text: timetext,
                                  color: MyColors.grey,
                                  fontSize: 10.0,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                CustomContainerWidget(
                                  child: Center(
                                      child: CustomTextWidget(
                                    text: 'Apply',
                                    color: MyColors.white,
                                  )),
                                  height: 40.0,
                                  width: 70.0,
                                  circular: 20.0,
                                  color: MyColors.red,
                                  bcolor: MyColors.red,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class PriceRatingContainer extends StatelessWidget {
  var text;

  var text1;
  var rate;
  var price;
  var discountprice;
  var imageurl;
  PriceRatingContainer(
      {this.discountprice,
      this.imageurl,
      this.price,
      this.rate,
      this.text,
      this.text1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 170.0,
              height: 200.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(imageurl),
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              bottom: -15.0,
              right: -15.0,
              child: CircleAvatar(
                child: CustomIcon(
                  icon: Icons.favorite_border,
                  color: MyColors.grey,
                ),
                backgroundColor: MyColors.white,
              ),
            ),
            Positioned(
              top: 10.0,
              left: 15.0,
              child: CustomContainerWidget(
                child: Center(
                  child: CustomTextWidget(
                    text: '-20%',
                    color: MyColors.white,
                  ),
                ),
                height: 20.0,
                width: 50.0,
                color: MyColors.red,
                circular: 30.0,
                bcolor: MyColors.white,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomIcon(
              icon: Icons.star,
              color: MyColors.yellow,
              Size: 13.0,
            ),
            CustomIcon(
              icon: Icons.star,
              Size: 13.0,
              color: MyColors.yellow,
            ),
            CustomIcon(
              icon: Icons.star,
              Size: 13.0,
              color: MyColors.yellow,
            ),
            CustomIcon(
              icon: Icons.star,
              Size: 13.0,
              color: MyColors.yellow,
            ),
            CustomIcon(
              icon: Icons.star,
              Size: 13.0,
              color: MyColors.yellow,
            ),
            CustomTextWidget(
              text: rate,
              color: MyColors.grey,
              fontSize: 10.0,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: text,
              color: MyColors.grey,
              fontSize: 10.0,
            ),
            CustomTextWidget(
              text: text1,
              color: MyColors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        Row(
          children: [
            CustomTextWidget(
              text: price,
              color: MyColors.grey,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              width: 10.0,
            ),
            CustomTextWidget(
              text: discountprice,
              color: MyColors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            )
          ],
        )
      ],
    );
  }
}

class ImageItemContainer extends StatelessWidget {
  var imageurl;
  ImageItemContainer({required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainerWidget(
              child: Center(
                child: CustomTextWidget(
                  text: 'New',
                  color: MyColors.white,
                ),
              ),
              height: 20.0,
              width: 50.0,
              color: MyColors.grey,
              circular: 30.0,
              bcolor: MyColors.white,
            ),
          ],
        ),
      ),
      width: 170.0,
      height: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(imageurl),
            fit: BoxFit.cover,
          )),
    );
  }
}

class AddImageText extends StatelessWidget {
  var image;
  var text;
  AddImageText({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 70.0,
              child: Center(
                  child: CustomTextWidget(
                text: text,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              )),
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0))),
            ),
          ),
          Expanded(
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
            ),
          ),
        ],
      ),
    );
  }
}

class WomenItemCard extends StatelessWidget {
  var imageurl;
  var text1;
  var text2;
  var text3;

  WomenItemCard({this.imageurl, this.text1, this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Row(
        children: [
          CustomImageContainer(
            imageUrl: imageurl,
            fit: BoxFit.cover,
            height: 90.0,
            width: MediaQuery.of(context).size.width / 3.0,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CustomContainerWidget(
                  height: 90.0,
                  color: MyColors.white,
                  bcolor: MyColors.white,
                  circular: 10.0,
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: text1,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                        CustomTextWidget(
                          text: text2,
                          color: MyColors.grey,
                          fontSize: 12.0,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 12.0,
                            ),
                            Icon(
                              size: 12.0,
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              size: 12.0,
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              size: 12.0,
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              size: 12.0,
                              Icons.star_border,
                              color: Colors.grey,
                            ),
                            CustomTextWidget(
                              text: '(4)',
                              color: Colors.grey,
                              fontSize: 12.0,
                            )
                          ],
                        ),
                        CustomTextWidget(
                          text: text3,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  )),
              Positioned(
                bottom: -12.0,
                right: -12.0,
                child: CircleAvatar(
                  backgroundColor: MyColors.white,
                  child: Icon(
                    Icons.favorite_border,
                    color: MyColors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
