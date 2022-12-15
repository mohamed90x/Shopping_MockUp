import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support1/core/constants/app_constants.dart';
import 'package:support1/core/managers/colors_manager.dart';
import 'package:support1/persentation/Screen/category_page.dart';
import 'package:support1/persentation/Screen/cubit/category_product_cubit.dart';
import 'package:support1/persentation/Screen/cubit/category_product_state.dart';

import '../../core/managers/app_sizes.dart';
import '../../model/category_model.dart';
import '../components/text_component.dart';

class ProductPage extends StatelessWidget {

    ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit,ProductState>(
      builder:(context, state) =>  Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Category_Page(),))

              ,
              child: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.shadowColor,)),
        ),
        body: (state is SuccessProductState)
            ? SingleChildScrollView(
              child: Container(
          color: Colors.grey[200],
          child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 1/1.60,
                children:
                List?.generate(
                    ProductCubit.get(context).Categorymodel!.products!.length, (index) => ProductItem( ProductCubit.get(context).Categorymodel!.products![index] ,context))
          ),
        ),
            ):(state is FailedProductState)
            ? Center(
          child: TextComponent(
            text: "state.errorModel.statusMessage",
            color: AppColors.whiteColor,
            fontSize: AppSizes.s25,
          ),
        )
            : const Center(
          child: CircularProgressIndicator(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
Widget ProductItem(Products? product,context ){

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {

        AppConstants.pro_id=product.id!;
        print(AppConstants.pro_id);
        print(product.id);
/*
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductDetailsPage(),)) ;
*/

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [

              Container(
                height: 200,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary1Color.withOpacity(0.35),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child:Image(
                  image:
                  NetworkImage(
                      product!.images![0].toString()),
                  width: double.infinity,
                ),



              ),
              if(product.discountPercentage!=0)
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white54,
                    ),
                    width: 200,
                    height: 200,

                    child: Center(child:
                    Transform.rotate(
                      angle: 3.14 / 5,
                      child: Text("Sale",style:
                      TextStyle(fontWeight: FontWeight.w900,
                          color:AppColors.primary1Color,fontSize: 70),

                      ),
                    )),
                  ),
                )
            ],),

          SizedBox(height: 20,),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(7.0).copyWith(bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title.toString(),maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style:TextStyle(fontSize: 14,height: 1.3,fontWeight: FontWeight.w500) ,
                    ),
                    Row(
                      children: [ Text("${product.price?.round()}",
                        style:TextStyle(fontSize: 14, color: Colors.deepOrange,fontWeight: FontWeight.w900) ,
                      ),

                        Spacer(),
                        IconButton(padding:EdgeInsets.zero,
                            onPressed: (){



                            },
                            icon: CircleAvatar(
                                radius:17,
                                backgroundColor: Colors.grey[200],
                                child: Icon( Icons.add  ,color: Colors.white,)
                            )
                        ),
                        IconButton(padding:EdgeInsets.zero,
                            onPressed: (){



                            },
                            icon: CircleAvatar(
                                radius:17,
                                backgroundColor: Colors.grey[200],
                                child: Icon(Icons.favorite ,color: Colors.deepOrange,)
                            )
                        )
                      ],),],),
              ),
            ),
          ),



        ],
      ),
    ),
  );

}