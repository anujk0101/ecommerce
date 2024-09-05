import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/data/models/register_user_model.dart';
import 'package:ecommerce/domain/app_exception.dart';
import 'package:http/http.dart' as httpClient;

import '../app_pref.dart';

class ApiHelper{
String? token;
  //Future<dynamic> postAPI({required String url,required RegisterUserModel rUserModel}) async{
  Future<dynamic> postAPI({required String url, Map<String,dynamic>? rUserModel,bool isHeaderRequired=false}) async{
    var uri=Uri.parse(url);

    try{
      if(isHeaderRequired) {
        await getTokan();
      }
      var res=await httpClient.post(uri,body: jsonEncode(rUserModel),headers: {"Authorization" : "Bearer ${token}"});
      return returnJsonResponse(res);

    } on SocketException catch(e){
      throw (FetchDataException(errorMsg: "No Internet!!!"));
    }
  }


Future<void> getTokan() async{
  var pref=AppPref();
  await pref.initPrefs();
  token=pref.getUserId();
}

  Future<dynamic> getCat({required String url, bool isHeaderRequired=false}) async{
    var uri=Uri.parse(url);

    try{
      if(isHeaderRequired){
        await getTokan();
       /* var pref=AppPref();
        await pref.initPrefs();
        token=pref.getUserId();*/
      }
      var res=await httpClient.get(uri,headers: {
        "Authorization" : "Bearer ${token}"
      });
      return returnJsonResponse(res);

    } on SocketException catch(e){
      throw (FetchDataException(errorMsg: "No Internet!!!"));
    }
  }

  dynamic returnJsonResponse(httpClient.Response response){
  switch(response.statusCode){

    case 200: {
      var mData=jsonDecode(response.body);
      return mData;
    }

    case 400:
      throw BadRequestException(errorMsg: response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(errorMsg: response.body.toString());
    case 500:
    default:
      throw FetchDataException(errorMsg: "Error while Communication with Server with status code: ${response.statusCode}");
  }
  }

}