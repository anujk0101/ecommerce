import 'dart:async';

import 'package:ecommerce/domain/app_pref.dart';
import 'package:ecommerce/ui/home/home_page.dart';
import 'package:ecommerce/ui/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
String loggedInUserId='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1),()async{
      var prefs=AppPref();
      await prefs.initPrefs();
      loggedInUserId = prefs.getUserId();
      loggedInUserCheck();
    });
  }

  loggedInUserCheck(){
    if(loggedInUserId == ''){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginPage()));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("asset/image/icon/shopping.png",width: 200,height: 200,),),
    );
  }
}
