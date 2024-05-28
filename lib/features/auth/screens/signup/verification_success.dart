import 'package:flutter/material.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/sizes.dart';


class VerifySuceesScreen extends StatelessWidget {

  const VerifySuceesScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});
  final String image ,title,subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(Tsizes.appbarHieght),
        child: Column(children: [
          //image

          Image(image: AssetImage(image),width:THelperFunctions.screenWidth() *0.6,),

          //   TImages.staticsuccesillustrion, Ttile & subtitle  
        Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
        const SizedBox(height: Tsizes.spacebtwnitems,),
        Text(subtitle ,style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
        const SizedBox(height: Tsizes.spacebtwnitems,),
      
      const SizedBox(height: Tsizes.spacebtwnsection,),
      
      //buttons

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: onPressed, child: Text('Continue',style: Theme.of(context).textTheme.titleMedium,))),
                        const SizedBox(height: Tsizes.spacebtwnitems,),
               const SizedBox(height: Tsizes.spacebtwnsection,),
     
         
        ],),),
      ),
    );
  }
}