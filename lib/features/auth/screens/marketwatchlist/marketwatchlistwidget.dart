import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../commons/widgets/bannerImages/TroundedbannerImages.dart';
import '../../../../../commons/widgets/circularIcon/Tcircularicons.dart';
import '../../../../../commons/widgets/product/roundedcontainer.dart';
import '../../../../../helpers/helper_functions.dart';
import '../../../../../utils/constatnts/Image_strings.dart';
import '../../../../../utils/constatnts/colors.dart';
import '../../../../../utils/constatnts/sizes.dart';

class TmarketItemwidget extends StatelessWidget {
  const TmarketItemwidget({
    super.key,
   });
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return TroundedConatiner(

      backgroundColor: dark?Tcolors.blck:Tcolors.light,
     padding: EdgeInsets.all(5),
     radius: 5,
     showBorder: true,
     child: Column(
           children: [
             Row(
               children: [
                 //Trounded Image
                          
                 TroundedBannerImage(
                     backgroundColor:
                         THelperFunctions.isDarkMode(context)
                             ? Tcolors.darkgrey
                             : Tcolors.light,
                     width: 70,
                     height: 70,
                     padding: EdgeInsets.all(Tsizes.sm),
                     imgurl: TImages.bannerImage1),
                          
                 const SizedBox(
                   width: Tsizes.spacebtwnsection,
                 ),
                 //cp
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                 Text(
                   "Kamdhenu Desi Ghee",style: 
                     Theme.of(context).textTheme.titleMedium!.copyWith(
                       fontSize: 14,fontWeight: FontWeight.w500
                     ),),
                        Row(
                         children: [
                         Text.rich(TextSpan(
                          children:  [
                                  TextSpan(text: " \660",            style:
                                         Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontSize: 16,fontWeight: FontWeight.w500
                                          ,
                                          color: Tcolors.warning
                                     )),
                             ])),
                          SizedBox(width: Tsizes.spacebtwInputField/2,),
                          Icon(Iconsax.arrow_down,color: Colors.red,size: 15,)

                       ],
                     ),

                      Row(
                         children: [
                         Text.rich(TextSpan(
                          children:  [
                               
                                  TextSpan(text: "\-40",            style:
                                         Theme.of(context).textTheme.titleMedium!.copyWith(
                                          fontSize: 14,fontWeight: FontWeight.w500
                                          ,
                                          color: Tcolors.warning
                                     )),
                             ])),
                         SizedBox(width: Tsizes.spacebtwInputField/2,),
                          
                         Text("(2.2%)")
                       ],
                     ),
                   ],
                 )
               ],
             ),
                 
          const SizedBox(
                   height: Tsizes.spacebtwnitems/2,
                 ),
            
           ],
         ),
                          );
  }
}
