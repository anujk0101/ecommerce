import 'dart:convert';

import 'package:ecommerce/data/models/user_model.dart';
import 'package:ecommerce/domain/remote/api_helper.dart';
import 'package:ecommerce/domain/remote/urls.dart';
import 'package:ecommerce/ui/login/login_bloc/signin_event.dart';
import 'package:ecommerce/ui/login/login_bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/app_exception.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
 ApiHelper apiHelper;
  SigninBloc({required this.apiHelper}) : super(SigninInitialState()) {
    on<LoginUserEvent>((event, emit) async{
      emit(SigninLoadingState());

      try{
       var jsonResponse= await apiHelper.postAPI(url: Urls.LOGIN_USER, rUserModel: event.sUserDetails);
      if(jsonResponse['status']){
        UserModel userModel=UserModel.fromMap(jsonResponse);
        emit(SigninLoadedState(uModel: userModel));
      }
      else{
        emit(SigninErrorState(errorMsg: jsonResponse['message']));
      }
      }
      catch(e){
        emit(SigninErrorState(errorMsg: (e as AppException).toError()));
      }

    });
  }
}
