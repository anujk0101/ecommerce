import 'package:ecommerce/data/models/cat_model.dart';
import 'package:ecommerce/domain/remote/urls.dart';
import 'package:ecommerce/ui/home/homepage_bloc/home_event.dart';
import 'package:ecommerce/ui/home/homepage_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/app_exception.dart';
import '../../../domain/remote/api_helper.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
 ApiHelper apiHelper;
  HomeBloc({required this.apiHelper}) : super(HomeInitialState()){
    on<FetchCategoryItemEvent>((event,emit) async{
      emit(HomeLoadingState());
      try {
        var res = await apiHelper.getCat(url: Urls.CATEGORIES,token: event.tokan!);
        if(res['status']){
            emit(HomeSuccessState(cModel: CatModel.fromMap(res)));
        }
        else{
          emit(HomeFailedState(errorMsg: res['message']));
        }
      }
      catch(e){
        emit(HomeFailedState(errorMsg: (e as AppException).toError()));
      }

    });
  }


}