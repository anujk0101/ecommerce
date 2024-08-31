class RegisterUserModel {
  String name, email, mobile_number, password;



  RegisterUserModel(
      {required this.name,
      required this.email,
      required this.mobile_number,
      required this.password});

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
        name: map['name'],
        email: map['email'],
        mobile_number: map['mobile_number'],
        password: map['password']);
  }

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'mobile_number' :mobile_number,
      'password' : password
    };
  }

}
