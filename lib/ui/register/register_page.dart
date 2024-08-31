import 'dart:convert';

import 'package:ecommerce/data/models/register_user_model.dart';
import 'package:ecommerce/ui/register/reg_bloc/register_bloc.dart';
import 'package:ecommerce/ui/register/reg_bloc/register_event.dart';
import 'package:ecommerce/ui/register/reg_bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as httpClient;

class RegisterPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  List<String> gender = ["Select your gender", "Male", "Female"];
  String selectedValue = "Select your gender";
  String msg = "";

  bool isLoading = false;

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
              "Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Name",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
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
              controller: mobileController,
              decoration: InputDecoration(
                  hintText: "Mobile",
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
            TextField(
              controller: confirmPassController,
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

            /*
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: StatefulBuilder(builder: (_, sS) {
                return DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    // isDense: true,
                    menuMaxHeight: 350,
                    /* underline: Container(
                      height: 1,
                      color: Colors.black,
                    ),*/
                    items: gender.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedValue = value!;
                      sS(() {});
                    },
                    value: selectedValue,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
            ), */
            //
            StatefulBuilder(
              builder: (_, sS) {
                return BlocListener<RegisterBloc,RegisterState>(
                  listener: (_, state) {
                    if (state is RegisterLoadingState) {
                      isLoading = true;
                      sS((){});
                    } else if (state is RegisterSuccessState) {
                      isLoading = false;
                      sS((){});
                      Navigator.pop(context);
                    } else if (state is RegisterFailedState) {
                      isLoading = false;
                      sS((){});
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${state.errorMsg}')));
                    }
                  },
                  child: isLoading
                      ? Row(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              width: 11,
                            ),
                            Text("Registering"),
                          ],
                        )
                      : ElevatedButton(
                          //
                          child: Text("Register"),
                          onPressed: () {
                            if (passController.text.toString() ==
                                confirmPassController.text.toString()) {
                              context.read<RegisterBloc>().add(RegisterNewUser(rUserModel: RegisterUserModel(name: nameController.text.toString(), email: emailController.text.toString(), mobile_number: mobileController.text.toString(), password: passController.text.toString())));

                             /* context.read<RegisterBloc>().add(RegisterNewUser(rUserModel:
                                  {
                                'name' : nameController.text.toString(),
                                'email' : emailController.text.toString(),
                                'mobile' : mobileController.text.toString(),
                                'pass' : passController.text.toString()
                              }
                              ));*/
                            }
                          },
                        ),
                );
              },
            ),

            //
          ],
        ),
      ),
    );
  }
/*
  Future<bool> registerUser() async {
    String name = nameController.text.toString();
    String email = emailController.text.toString();
    String mobNo = mobileController.text.toString();
    String pass = passController.text.toString();
    //String confPass=confirmPassController.text.toString();

    String url = "https://www.marketcraft.in/ecommerce-api/user/registration";
    var res = await httpClient.post(Uri.parse(url),
        body: jsonEncode({
          "name": name,
          "mobile_number": mobNo,
          "email": email,
          "password": pass
        }));

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      msg = data['message'];
      return data['status'];
    } else {
      return false;
    }
  }*/
}
