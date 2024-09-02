import 'package:ecommerce/data/models/cat_model.dart';
import 'package:ecommerce/domain/app_color.dart';
import 'package:ecommerce/domain/app_pref.dart';
import 'package:ecommerce/domain/catagory_item.dart';
import 'package:ecommerce/ui/home/homepage_bloc/home_bloc.dart';
import 'package:ecommerce/ui/home/homepage_bloc/home_event.dart';
import 'package:ecommerce/ui/home/homepage_bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String? tokanSharedPrefs;
//CatModel? cModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotan();

  }

  getTotan() async{
    var pref=AppPref();
    await pref.initPrefs();
     tokanSharedPrefs=pref.getUserId();
    context.read<HomeBloc>().add(FetchCategoryItemEvent(tokan: tokanSharedPrefs));
  }
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
                /*Container(
                  height: 150,
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
                              SizedBox(
                                width: 95,
                                child: Text(
                                  "${CatagoryItem.mCategories[index].catName}",textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                  //overflow: TextOverflow.clip,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),*/

                BlocBuilder<HomeBloc,HomeState>(builder: (_,state){
                  if(state is HomeLoadingState){
                    return CircularProgressIndicator();
                  }
                  else if(state is HomeFailedState){
                    return Text("error: ${state.errorMsg}");
                  }
                  else if(state is HomeSuccessState){
                    return Container(
                      height: 150,
                      child: ListView.builder(
                          itemCount: state.cModel.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Container(
                              width: 95,
                              padding: EdgeInsets.only(right: 8.0),
                              child: Column(
                                children: [
                                /*  ClipOval(
                                      child: Image.asset(
                                        "${CatagoryItem.mCategories[index].catImgUrl}",
                                        fit: BoxFit.cover,
                                        width: 80.0,
                                        height: 80.0,
                                      )),*/
                                  SizedBox(
                                    width: 95,
                                    child: Text(
                                      "${state.cModel.data![index]!.name}",textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                      //overflow: TextOverflow.clip,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    );
                  }
                  return Container();
                }),

                SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Speciall For you",
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
