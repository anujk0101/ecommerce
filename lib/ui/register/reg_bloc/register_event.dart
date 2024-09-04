import 'package:ecommerce/data/models/register_user_model.dart';

abstract class RegisterEvent{}

class RegisterNewUser extends RegisterEvent{
 //RegisterUserModel rUserModel;
  Map<String,dynamic> rUserModel;
  RegisterNewUser({required this.rUserModel});
}


