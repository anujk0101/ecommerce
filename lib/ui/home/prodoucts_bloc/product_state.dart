import 'package:ecommerce/data/models/products_model.dart';

abstract class ProductState{}

class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductSuccessState extends ProductState{
  ProductsModel mdata;
  ProductSuccessState({required this.mdata});
}
class ProductFailedState extends ProductState{
  String errorMsg;
  ProductFailedState({required this.errorMsg});
}
