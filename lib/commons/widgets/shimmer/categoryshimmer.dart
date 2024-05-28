import 'package:flutter/material.dart';
import 'package:u1r/commons/widgets/shimmer/shimmer.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

class Tcategoryshimmereffect extends StatelessWidget{
  
  
  const Tcategoryshimmereffect({super.key,  this.itemCount=6});
   
   final int itemCount;     
  @override
  Widget build(BuildContext context) {
  

      return SizedBox(
         height: 100,
         child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10,),
          scrollDirection: Axis.horizontal,
           shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (_,__){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                      //Image
                           TShimmerWidget(width: 70, height: 70, radius: 55),
                            SizedBox(height: Tsizes.spacebtwnitems/2,),                          
                            TShimmerWidget(width: 70, height:8, )
                        ],
                  ),
              );
            }
          ),

      );
  
   }



}