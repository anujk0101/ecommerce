import 'package:ecommerce/data/models/products_model.dart';
import 'package:ecommerce/domain/remote/api_helper.dart';
import 'package:ecommerce/domain/remote/urls.dart';
import 'package:ecommerce/ui/home/prodoucts_bloc/product_event.dart';
import 'package:ecommerce/ui/home/prodoucts_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ApiHelper apiHelper;

  ProductBloc({required this.apiHelper}) : super(ProductInitialState()) {
    on<ProductFetchEvent>((event, emit) async {
      emit(ProductLoadingState());

      try {
        var res = await apiHelper.postAPI(url: Urls.PRODUCTS, isHeaderRequired: true);
        emit(ProductSuccessState(mdata: ProductsModel.fromMap(res)));
      } catch (e) {
        emit(ProductFailedState(errorMsg: e.toString()));
      }
    });
  }
}
