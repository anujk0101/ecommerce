import '../../../data/models/cat_model.dart';

abstract class HomeState{}

class HomeInitialState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeSuccessState extends HomeState{
  CatModel cModel;
  HomeSuccessState({required this.cModel});
}
class HomeFailedState extends HomeState{
  String errorMsg;
  HomeFailedState({required this.errorMsg});
}