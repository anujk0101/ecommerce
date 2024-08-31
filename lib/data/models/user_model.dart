class UserModel{
  bool status;
  String message;
  String tokan;

  UserModel({required this.status, required this.message, required this.tokan});

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(status: map['status'], message: map['message'], tokan: map['tokan']);
  }

  /*Map<String,dynamic> toMap(){

  }*/
}