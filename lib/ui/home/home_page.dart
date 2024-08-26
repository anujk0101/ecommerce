import 'package:ecommerce/domain/app_color.dart';
import 'package:ecommerce/domain/catagory_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 11, right: 11),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'asset/image/icon/four-circle.png',
                        height: 50,
                        width: 20,
                      ),
                      backgroundColor: AppColor.greyColor,
                      radius: 25,
                    ),
                    CircleAvatar(
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 30,
                      ),
                      backgroundColor: AppColor.greyColor,
                      radius: 25,
                    )
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      hintText: "Search...",
                      fillColor: AppColor.greyColor,
                      border: InputBorder.none,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none)),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: CatagoryItem.mCategories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          width: 95,
                          padding: EdgeInsets.only(right: 8.0),
                          child: Column(
                            children: [
                              ClipOval(
                                  child: Image.asset(
                                "${CatagoryItem.mCategories[index].catImgUrl}",
                                fit: BoxFit.cover,
                                width: 80.0,
                                height: 80.0,
                              )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${CatagoryItem.mCategories[index].catName}",
                                    style: TextStyle(fontSize: 15),
                                    //overflow: TextOverflow.clip,
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For you",
                      style: TextStyle(fontSize: 25),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See all",
                          style: TextStyle(color: Colors.grey),
                        ))
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                GridView.builder(
                    itemCount: CatagoryItem.mCategories.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 7 / 9
                    ),
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColor.greyColor,
                          borderRadius: BorderRadius.circular(21)
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
