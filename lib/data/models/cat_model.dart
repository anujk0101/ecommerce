import 'package:flutter/foundation.dart';

class CatObjModel {
  String? id, name, status, created_at, updated_at;

  CatObjModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.created_at,
      required this.updated_at});

  factory CatObjModel.fromMap(Map<String, dynamic> map) {
    return CatObjModel(
        id: map['id'],
        name: map['name'],
        status: map['status'],
        created_at: map['created_at'],
        updated_at: map['updated_at']);
  }

}

class CatModel{
  String? message;
  bool? status;
  List<CatObjModel?>? data;

  CatModel({required this.message,required this.status,required this.data});

  factory CatModel.fromMap(Map<String,dynamic> map){
    List<CatObjModel?> pModel=[];
    for(Map<String,dynamic> eachData in map['data']){
      pModel.add(CatObjModel.fromMap(eachData));
    }
    return CatModel(message: map['message'], status: map['status'], data: pModel);
  }
}
