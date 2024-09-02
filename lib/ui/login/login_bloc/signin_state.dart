import 'package:ecommerce/data/models/user_model.dart';

abstract class SigninState{}

class SigninInitialState extends SigninState{}
class SigninLoadingState extends SigninState{}
class SigninLoadedState extends SigninState{
  UserModel uModel;
  SigninLoadedState({required this.uModel});
}
class SigninErrorState extends SigninState{
  String errorMsg;
  SigninErrorState({required this.errorMsg});
}
