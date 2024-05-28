import 'package:flutter/material.dart';

import 'package:u1r/commons/widgets/product/roundedcontainer.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/colors.dart';

import '../../../../utils/constatnts/sizes.dart';
class tcoupouncart extends StatelessWidget {
  const tcoupouncart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TroundedConatiner(
      showBorder: true,
      backgroundColor: THelperFunctions.isDarkMode(context)?Tcolors.dark:Tcolors.white,
      padding: EdgeInsets.all(Tsizes.md),
      child: Row(children: [
        //textfield
        Flexible(
          
          child: 
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Have Promo code enter here',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none


              
            ),
          )
        
        ),//,button
       SizedBox(
        width: 80,
        child: ElevatedButton(
          
          onPressed: (){}, 
          style: ElevatedButton.styleFrom(
            foregroundColor: THelperFunctions.isDarkMode(context)? Tcolors.white.withOpacity(0.5):Tcolors.dark.withOpacity(0.5),
            backgroundColor: Colors.grey.withOpacity(0.2),
      side: BorderSide(color:Colors.grey.withOpacity(0.2) )
          ),
          child:Text('Apply')
          
           ),
       )
      ]),
    );
  }
}