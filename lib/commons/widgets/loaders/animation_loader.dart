import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:u1r/utils/constatnts/colors.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget{


final String text;
final String animation;
final bool showAction;
final String? actionText;
final VoidCallback? onActionPressed;




const  TAnimationLoaderWidget({
super.key, required this.text, 
  required this.animation,
  this.showAction=false, 
  this.actionText,  
  this.onActionPressed,


});


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(children: [

        Lottie.asset(animation,width: MediaQuery.of(context).size.width*0.8),
        const SizedBox(height: Tsizes.defaultspacing,),
        Text(text,style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,),
        const SizedBox(height: Tsizes.defaultspacing,),
        showAction
        ?SizedBox(width: 250,
        child: OutlinedButton(
        
        child:Text(actionText!,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Tcolors.light,
            fontWeight: FontWeight.w500,
            fontSize: 16
        ),) ,
        onPressed:onActionPressed ,style: OutlinedButton.styleFrom(backgroundColor: Tcolors.primaryColorbtnshade,
        side: BorderSide.none
        ),),)
        :const SizedBox(),


      ],),
    );

    }}