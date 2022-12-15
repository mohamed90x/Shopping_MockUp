import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support1/persentation/Screen/category_page.dart';
import 'package:support1/shared/cache_helper.dart';

import 'app/app.dart';
import 'bloc_observer/bloc_observer.dart';
import 'core/networks/dio_helper.dart';
import 'on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer= MyBlocObserver();
  Widget ?widget;
  await CashHelper.init();
  dynamic onBoarding = CashHelper.getData(key: "onBoarding");
  NetworkService.initDio();
  if(onBoarding!=null){
      widget=  Category_Page();
    }
  else{
    widget=const Onboarding();
  }
  runApp( MyApp(widget:widget));
}



