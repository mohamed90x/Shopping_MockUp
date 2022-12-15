
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:support1/core/managers/app_sizes.dart';
import 'package:support1/core/managers/colors_manager.dart';
import 'package:support1/persentation/Screen/category_page.dart';
import 'package:support1/persentation/Screen/splash_screen.dart';
import 'package:support1/persentation/components/size_box.dart';
import 'package:support1/persentation/components/text_component.dart';

import '../shared/cache_helper.dart';


class Onboarding extends StatefulWidget {

  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}
bool islast =false ;
class _OnboardingState extends State<Onboarding> {
  var boardcontroller =PageController();
  List <BoardItemsModel> BoardItems =[
    BoardItemsModel(
        "ORDER ONLINE",
        "Buy Online From Our Marker From Your Home",
        "assets/images/onboard_1.jpeg",
        "assets/images/icons8-shop.gif"),
    BoardItemsModel(
        "PAY",
        "We Provide Cashless Option",
        "assets/images/onboard_2.jpeg",
        'assets/images/icons8-debit-card.gif'),
    BoardItemsModel(
        "DELIVERY",
        "Fast Delivery In 20 minutes",
        "assets/images/onboard_3.jpeg",
        'assets/images/icons8-truck.gif'),

  ];
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          backgroundColor: AppColors.primary1Color,
          elevation: 0,

        ),
        body:  Column(
          children: [
            Expanded(child:
            PageView.builder(
              onPageChanged: (int index){
                if(index==BoardItems.length-1){
                  setState(() {
                    islast=true;
                  });
                }else{
                  islast=false;
                  print(islast);
                }
              },
              physics:BouncingScrollPhysics() ,
              controller: boardcontroller,
              itemBuilder: (context, index) => BuildItemBoard(BoardItems[index]),
              itemCount: BoardItems.length,




            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                TextButton(onPressed: (){
                  CashHelper.saveData(key: 'onBoarding', value:true).then((value) => {
                    if(value){

                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Category_Page()), (route) => false)


                    }

                  });
                },
                  child:Text("Skip",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.blueGrey)
                  ),
                ),
                Spacer(),
                SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      dotColor: AppColors.shadowColor,
                      activeDotColor: AppColors.primary2Color,


                    ),
                    controller: boardcontroller, count: BoardItems.length),
                Spacer(),
                FloatingActionButton(
                  backgroundColor:  AppColors.primary1Color,
                  onPressed: (){
                    if(islast){
                      setState(() {
                        CashHelper.saveData
                          (key: 'onBoarding', value:true).then((value) => {
                          if(value){

                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Category_Page()), (route) => false)


                          }

                        });
                      });
                    }else{
                      boardcontroller.nextPage(duration:Duration(milliseconds: 750) , curve:Curves.fastLinearToSlowEaseIn );}
                  },child: Icon(Icons.arrow_forward_ios),
                )
              ],),
            )
          ],
        )

    );
  }
}


Widget BuildItemBoard(BoardItemsModel model)=>
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Image(image: AssetImage("${model.image}") ,),
        SizedBox(height: AppSizes.s60,),
        TextComponent(text: "${model.Titel}", color: AppColors.primary1Color, fontSize: AppSizes.s30,fontWeight: FontWeight.w800,),
         sizedBoxComponentForHeight(height: AppSizes.s10),
        TextComponent(text: "${model.body}", color:  Colors.blueGrey, fontSize: AppSizes.s15,fontWeight: FontWeight.w500,),
        SizedBox(height: AppSizes.s40,),

        Center(
          child:  Padding(
            padding: const EdgeInsets.all(15.0).copyWith(top: 20),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(6,6),
                        blurRadius: 15,
                        spreadRadius: 1
                    ),
//lighter shadow on top left
                    BoxShadow(
                        color: AppColors.primary2Color,
                        offset: Offset(-6,-6),
                        blurRadius: 15,
                        spreadRadius: 1
                    )
                  ]

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),

                child: Padding(
                  padding: const EdgeInsets.all(10.0).copyWith(right: 17),
                  child:   Image(

                      image:  AssetImage("${model.icon}")),
                ),


              ),
            ),
          ),


        )],
    );
class BoardItemsModel{
  String? Titel ;
  String ? body ;
  String? image ;
  String ?icon ;

  BoardItemsModel( @required this.Titel,@required this.body,@required this.image,@required this.icon);

}

