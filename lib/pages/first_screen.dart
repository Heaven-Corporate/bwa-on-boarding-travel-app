// @dart=2.9
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ui_travelapp/constant.dart';
import 'package:ui_travelapp/dummy.dart';
import 'package:ui_travelapp/model/item_model.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    // todo: buat function onBoardingItem
    onBoardingItem(ItemModel itemModel) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(itemModel.imageUrl),
          SizedBox(
            height: 40,
          ),
          Text(
            itemModel.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kTitleColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            itemModel.subtitle,
            style: TextStyle(fontSize: 16, color: kSubtitleColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 0 ? kTitleColor : kSubtitleColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 1 ? kTitleColor : kSubtitleColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? kTitleColor : kSubtitleColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            onPressed: () {
              carouselController.nextPage();
            },
            color: kTitleColor,
            minWidth: 180,
            padding: EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              currentIndex == 2 ? 'Get Started' : 'Next',
              style: TextStyle(
                  fontSize: 16,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                CarouselSlider(
                  items: data
                      .map((item) => onBoardingItem(ItemModel.fromJson(item)))
                      .toList(),
                  options: CarouselOptions(
                    initialPage: currentIndex,
                    height: double.infinity,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  carouselController: carouselController,
                ),
                currentIndex == 2
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            carouselController.animateToPage(2);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 28),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  color: kSubtitleColor, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
