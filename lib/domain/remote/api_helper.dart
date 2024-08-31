import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/data/models/register_user_model.dart';
import 'package:ecommerce/domain/app_exception.dart';
import 'package:http/http.dart' as httpClient;

class ApiHelper{

  Future<dynamic> postAPI({required String url,required RegisterUserModel rUserModel}) async{
  //Future<dynamic> postAPI({required String url,required Map<String,dynamic> rUserModel}) async{
    var uri=Uri.parse(url);

    try{

      var res=await httpClient.post(uri,body: jsonEncode(rUserModel.toMap()));
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