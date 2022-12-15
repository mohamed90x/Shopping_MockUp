import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support1/core/constants/app_constants.dart';
import 'package:support1/persentation/Screen/products_page.dart';

import '../../core/constants/app_constants.dart';
import '../../core/managers/app_sizes.dart';
import '../../core/managers/colors_manager.dart';
import '../../core/managers/string_manager.dart';
import '../components/size_box.dart';
import '../components/text_component.dart';
class Category_Page extends StatelessWidget {
   Category_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <CategoryItemsModel> CategoryItems =[
      CategoryItemsModel(
          "smartphones",
          "assets/images/phone.jpeg"),
      CategoryItemsModel(
          "laptops",
          "assets/images/laptop.jpeg",
          ),
      CategoryItemsModel(
          "mens-watches",
          'assets/images/fitness-tracker-sport-bracelet-smartwatch-technology.jpeg'),
      CategoryItemsModel(
          "womens-bags",
          'assets/images/woman-shopping-with-fabric-tote-bag.jpeg'),

    ];
    return Scaffold(

      body:
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => BuildItemCategory(CategoryItems[index],context),

                itemCount: CategoryItems.length
              ),
            )
          ],
        ),


    );
  }
}
Widget BuildItemCategory(CategoryItemsModel model,context)=>

    InkWell(
      onTap: () {

        AppConstants.EndPoint= "${model.Titel}";
        print(AppConstants.EndPoint);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductPage(),)) ;

      },
      child: Container(
        height: 350,
        width: 400,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit:  StackFit.expand,
          children: [
        Image(  image:AssetImage("${model.image}"),fit: BoxFit.cover,),
            Center(child: TextComponent(text: "${model.Titel}", color: AppColors.BlackColor, fontSize: AppSizes.s40,fontWeight: FontWeight.w700,))

          ],
        ) ,





),
    );
class CategoryItemsModel{
  String? Titel ;
  String? image ;


  CategoryItemsModel( @required this.Titel,@required this.image);

}