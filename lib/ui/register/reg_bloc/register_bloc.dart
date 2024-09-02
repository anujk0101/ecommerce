import 'package:ecommerce/domain/app_exception.dart';
import 'package:ecommerce/domain/remote/api_helper.dart';
import 'package:ecommerce/domain/remote/urls.dart';
import 'package:ecommerce/ui/register/reg_bloc/register_event.dart';
import 'package:ecommerce/ui/register/reg_bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  ApiHelper apiHelper;

  RegisterBloc({required this.apiHelper}) : super(RegisterInitialState()) {

    on<RegisterNewUser>((event, emit) async{

      emit(RegisterLoadingState());

      try {
        var resJson =await apiHelper.postAPI(
            url: Urls.REGISTER_USER, rUserModel: event.rUserModel);
        if(resJson['status']){
          emit(RegisterSuccessState());
        } else  {
          emit(RegisterFailedState(errorMsg: resJson['message']));
        }
      } catch (e) {
        emit(RegisterFailedState(errorMsg: (e as AppException).toError()));
      }
    });
  }
}
