import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support1/persentation/Screen/category_page.dart';
import 'package:support1/persentation/Screen/cubit/category_product_cubit.dart';
import 'package:support1/persentation/Screen/splash_screen.dart';

import '../core/managers/colors_manager.dart';

class MyApp extends StatelessWidget {
  Widget widget ;
  MyApp({super.key,  required this.widget});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context) => ProductCubit()..getProduct(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.primary1Color,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primary1Color,
            ),
            cardTheme: CardTheme(
              color: AppColors.greyColor,
            ),
          ),
          home:  Splash(widget: widget,),

      ),
    );
  }
}
