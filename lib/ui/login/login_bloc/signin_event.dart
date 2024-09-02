import '../../../data/models/user_model.dart';

abstract class SigninEvent{}

class LoginUserEvent extends SigninEvent{
  Map<String, dynamic> sUserDetails;
  LoginUserEvent({required this.sUserDetails});
}