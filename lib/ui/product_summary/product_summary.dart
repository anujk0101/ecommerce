import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> carouselImgUrl = [
      'https://mir-s3-cdn-cf.behance.net/project_modules/max_3840_webp/34b5bf180145769.6505ae7623131.jpg',
      'https://www.retailnews.asia/wp-content/uploads/2021/03/Iphone13.jpeg',
      'https://www.kimstore.com/cdn/shop/articles/091323_iPhone_15_Coming_soon_banner.jpg?v=1694587621'
    ];

    List<Color> clrAvailable=[Color(0xff911d30),Color(0xff151515),Color(0xff1d4491),Color(0xff90471e)];

    int selectedItem = 0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Container(
          //padding: EdgeInsets.only(top: 15, left: 11, right: 11),
          child: Column(
            children: [
              SizedBox(
                height: 11,
              ),

              /// 1. top back, share and favourite icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.arrow_back_ios_rounded),
                      backgroundColor: Colors.white,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            child: Icon(Icons.share),
                            backgroundColor: Colors.white),
                        SizedBox(
                          width: 25,
                        ),
                        CircleAvatar(
                            child: Icon(Icons.favorite_border),
                            backgroundColor: Colors.white)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

              /// 2. carousel
              StatefulBuilder(builder: (_, sS) {
                return Stack(
                  children: [
                    CarouselSlider(
                        items: carouselImgUrl
                            .map((e) => SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Image.network(
                                    e,
                                    fit: BoxFit.fill,
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            autoPlayCurve: Curves.decelerate,
                            onPageChanged: (index, _) {
                              selectedItem = index;
                              sS(() {});
                            })),
                    const SizedBox(
                      height: 6,
                    ),
                    Positioned(
                      bottom: 2.0,
                      left: 0,
                      right: 0,
                      child: DotsIndicator(
                        dotsCount: carouselImgUrl.length,
                        position: selectedItem,
                        decorator: DotsDecorator(
                          color: Colors.white,
                          activeColor: Colors.grey,
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    )
                  ],
                );
              }),
              SizedBox(
                height: 15,
              ),

              /// 3.Description

              Container(
                padding: EdgeInsets.symmetric(horizontal: 21),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Text(
                      "iPhone",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rs. 140000",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star),
                                Text("320 Review")
                              ],
                            )
                          ],
                        ),
                        Text(
                          "Seller: Anuj Kumar",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Text("Color",
                      style: TextStyle(
                          fontSize: 20, )),


                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(children: [
            ElevatedButton(onPressed: (){}, child: Icon(Icons.remove)),

            ElevatedButton(onPressed: (){}, child: Icon(Icons.add)),
          ],),
          ElevatedButton(onPressed: (){}, child: Text("Add to Cart"))

        ],),),
      ),
    );
  }
}
