import 'package:ecommerce/ui/home/homepage_bloc/home_bloc.dart';
import 'package:ecommerce/ui/home/prodoucts_bloc/product_bloc.dart';
import 'package:ecommerce/ui/login/login_bloc/signin_bloc.dart';
import 'package:ecommerce/ui/login/login_page.dart';
import 'package:ecommerce/ui/register/register_page.dart';
import 'package:ecommerce/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/remote/api_helper.dart';

void main() {
  runApp(
     /* BlocProvider(
    create: (_) => SigninBloc(apiHelper: ApiHelper()),
    child: MyApp(),
  ));*/
  MultiBlocProvider(
    providers: [
      BlocProvider<SigninBloc>(
        create: (BuildContext context) => SigninBloc(apiHelper: ApiHelper()),
      ),
      BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(apiHelper: ApiHelper()),
      ),
      BlocProvider<ProductBloc>(
        create: (BuildContext context) => ProductBloc(apiHelper: ApiHelper()),
      ),
    ],
    child: MyApp(),));
}

/*BlocProvider(
          create: (_)=>SigninBloc(apiHelper: ApiHelper()),child: SplashPage()));*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: SplashPage());
  }
}
