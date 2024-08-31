abstract class RegisterState{}

class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{}
class RegisterFailedState extends RegisterState{
  String errorMsg;
  RegisterFailedState({required this.errorMsg});
}