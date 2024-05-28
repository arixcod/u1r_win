


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:u1r/utils/constatnts/sizes.dart';

import '../../../../utils/constatnts/colors.dart';
import '../../models/product_model.dart';

class ImageController extends GetxController{

        //variables
          RxString selectedProductImage=''.obs;

      // here get all the Images for the product
 
         List<String>getAllProductImages(ProductModel product){
       
      // Use Set to add unique Images only
              Set<String>images={};
              images.add(product.photoUrl);
              
              
              // get the images for the product if not null
              // Assign the first Images to thumbanil 
              
                selectedProductImage.value=product.photoUrl;
              
              //to get all the images using a loop

              for(int i=0; i<product.images.length;i++){
                    if(product.images[i]!='')
                  {
                     images.add(product.images[i]);
                  }
                }    
        return images.toList();
  }
    //show the zoomed Images
      
      void zoomImages(String image){

        Get.to(
          fullscreenDialog: true,
          ()=>Dialog.fullscreen(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Padding(padding: const EdgeInsets.symmetric(vertical: Tsizes.defaultspacing*2,horizontal:Tsizes.defaultspacing*2 ), 
                  child: CachedNetworkImage(
                    imageUrl: image,
                  ),
                  ),
                  const SizedBox(height: Tsizes.spacebtwnitems,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:OutlinedButton(
                      style:const ButtonStyle(
            
                          side: MaterialStatePropertyAll(BorderSide.none),
                          backgroundColor: MaterialStatePropertyAll(Tcolors.primaryColor)
                      ),
                      onPressed: ()=>Get.back(), child: Text('close'
                      ,style:TextStyle(

                      ),
                    )) ,

                  )
             ],),
          )
        );







        }
}