

import '../../../model/error_model.dart';

abstract class ProductState {}

class InitProductState extends ProductState {}

class SuccessProductState extends ProductState {}

class FailedProductState extends ProductState {


}

class LoadingProductState extends ProductState {}
