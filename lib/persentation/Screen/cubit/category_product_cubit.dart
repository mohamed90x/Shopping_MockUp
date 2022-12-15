import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_constants.dart';
 import '../../../core/networks/dio_helper.dart';
import '../../../model/category_model.dart';

import '../../../model/error_model.dart';
import 'category_product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  Category_Model ?Categorymodel;

  // List<Products> categoryProducts = [];

  ProductCubit() : super(InitProductState());

  static ProductCubit get(context) => BlocProvider.of(context);


  void getProduct() async {
    emit(LoadingProductState());

    NetworkService.getData(
        endPoint: AppConstants.EndPoint
    ).then((value) {
      Categorymodel = Category_Model.fromJson(value.data);
      print(AppConstants.EndPoint);
      emit(SuccessProductState());
    }).catchError((onError){
      print(onError.toString());
      emit(FailedProductState());
    });
  }
}
