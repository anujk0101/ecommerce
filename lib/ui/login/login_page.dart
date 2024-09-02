import 'dart:convert';

import 'package:ecommerce/domain/app_pref.dart';
import 'package:ecommerce/domain/remote/api_helper.dart';
import 'package:ecommerce/ui/home/home_page.dart';
import 'package:ecommerce/data/models/user_model.dart';
import 'package:ecommerce/ui/login/login_bloc/signin_bloc.dart';
import 'package:ecommerce/ui/login/login_bloc/signin_event.dart';
import 'package:ecommerce/ui/login/login_bloc/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as httpClient;
import '../register/reg_bloc/register_bloc.dart';
import '../register/register_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  UserModel? uModel;
  bool isSuccess=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BlocProvider(
                                create: (context) => RegisterBloc(apiHelper: ApiHelper()),
                                child: RegisterPage(),
                              )));
                },
                child: Text("Don\'t have an account, Create now")),
            SizedBox(
              height: 10,
            ),
            StatefulBuilder(builder: (_,sS){
              return BlocListener<SigninBloc,SigninState>(listener: (_,state) async{
                if(state is SigninLoadingState){
                  isSuccess=true;
                  sS((){});
                }
                else if(state is SigninErrorState){
                  isSuccess=false;
                  sS((){});
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.errorMsg}')));
                }
                else if(state is SigninLoadedState){
                  isSuccess=false;
                  sS((){});
                  var appPrefs=AppPref();
                  await appPrefs.initPrefs();
                  appPrefs.setUserId(state.uModel.tokan);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
                }
              },child: isSuccess ? Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(), SizedBox(width: 11,),
                  Text("Signing In")
                ],) : ElevatedButton(onPressed: (){
                  context.read<SigninBloc>().add(LoginUserEvent(sUserDetails: {"email": emailController.text.toString(),"password":passController.text.toString()}));
              }, child: Text("Sign In")),);
            }),

          /*  ElevatedButton(
                onPressed: () async {
                  UserModel? uModelData = await userLogin();
                  if (uModelData != null) {
                    if (uModelData.status) {
                      var appPref = AppPref();
                      await appPref.initPrefs();
                      appPref.setUserId(uModelData.tokan);

                      print("message: ${uModelData.message}");

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                    }
                  }
                },
                child: Text("Sign In")),*/
          ],
        ),
      ),
    );
  }

  /*Future<UserModel?> userLogin() async {
    String url = "https://www.marketcraft.in/ecommerce-api/user/login";

    var res = await httpClient.post(Uri.parse(url),
        body: jsonEncode({
          "email": emailController.text.toString(),
          "password": passController.text.toString()
        }));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      if (data['status']) {
        return UserModel(
            status: data['status'],
            message: data['message'],
            tokan: data['tokan']);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }*/
}
