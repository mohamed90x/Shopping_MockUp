import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:support1/core/constants/app_constants.dart';
import 'package:support1/core/managers/app_sizes.dart';
import 'package:support1/core/managers/colors_manager.dart';
import 'package:support1/persentation/Screen/category_page.dart';
import 'package:support1/persentation/components/size_box.dart';





class Splash extends StatelessWidget {
  Widget widget ;
   Splash({super.key,required this.widget});


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:  Column(
              children: [

                Container(
                  height: 42.25,
                  width: 50,
                  child: Container(
                    height: 142.25,
                    width: 50,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      fit:  StackFit.expand,
                      children: [
                        Image(  image:AssetImage("${AppConstants.Splashimage}"),fit: BoxFit.cover,),

                      ],
                    ) ,
                  ),
                ),


                sizedBoxComponentForHeight(height: 30),
                Container(
                  height: 10,
                  width: 200,
                  child: new LinearPercentIndicator(
                    animation: true,
                    animationDuration:  3350,
                    percent: 1,

                    progressColor: AppColors.primary1Color,
                  ),
                )

              ],
            ) ,


      nextScreen: widget,);
  }
}